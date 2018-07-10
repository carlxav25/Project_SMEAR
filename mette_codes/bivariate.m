function [slope, intercept, m_err, b_err, Goodness]=bivariate(x_inp, y_inp, low_lim, up_lim, fig, prec, inp_var_x, inp_var_y, inp_meth)

% Fits a slope to data points (x_inp and y_inp) with a bivariate fitting 
% method presented by Williamson (Can. J. Phys., 46, 1845???1847, 1968) and 
% York (Am J. Phys., 72(3), 367???375, 2004) and discussed by C.A. Cantrell 
% (Atmos. Chem. Phys., 8, 5477???5487, 2008). 
%
% Fit takes into account errors in both x- and y-values.
% Returns the slope and the value y(0).
%
% INPUT:
% x_inp             x-values
% y_inp             y-values
% low_lim           minimum of slope value
% up_lim            maximum of slope value
% fig (optional)    insert 1 if the resulted slope does not look good
% prec (opt)        resolution of the fit (10^(-prec))
%       The following inputs must be either all included or all left out.
% inp_var_x (opt)   weight or variance of x-values
% inp_var_y (opt)   weight or variance of y-values
% inp_meth (opt)    1 for weights and 2 for variances
%
% OUTPUT:
% slope             m in fitted y = m*x + b
% intercept         b in fitted y = m*x + b
% m_err             standard error in slope m
% b_err             standard error in intercept b
% Goodness          ?? some indicator of the goodness of the fit
%
% Excel macro (by C.A. Cantrell) of the method can be downloaded at
% http://www.atmos-chem-phys.net/8/5477/2008/acp-8-5477-2008-supplement.zip

% I don't have too clear idea of the method, it is just copied from the
% macro.
    
x=x_inp;
y=y_inp;



if nargin >= 4 & nargin <= 6
    
    % scaling the variances to be equal in both directions
    x_perc=prctile(x,[5 95]);
    y_perc=prctile(y,[5 95]);
    
    x_vals=x_perc(2)-x_perc(1);
    y_vals=y_perc(2)-y_perc(1);
    
    dev_factor=y_vals/x_vals;
    var_x=ones(length(x),1);
    var_y=ones(length(y),1).*dev_factor^2;
    meth=2;
    % -------
    if nargin == 4
        prec=2;
        fig=0;
    elseif nargin ==5
        prec=2;
    end
    if length(x)~=length(y)
        disp(' ')
        disp('The length of the input vectors x and y must be the same')
        disp(' ')
        return
    end
elseif nargin==9
    var_x=inp_var_x;
    var_y=inp_var_y;
    meth=inp_meth;
    if length(x)~=length(y) || length(x)~=length(var_x) || length(x)~=length(var_y)
        disp(' ')
        disp('The length of the input vectors x and y and their')
        disp('weights/variances must be the same')
        disp(' ')
        return 
    end
else
    disp(' ')
    disp('Some input values were missing!')
    disp('Note: if you give one variance/weight, you must give also ')
    disp('the other and clarify wether they are variances od weights')
    disp(' ')
end

guess1=low_lim;

step=10^prec;

for i=1:(up_lim-low_lim)*step       % calculates slopes for every step from low_lim to up_lim
    
    guess=guess1+(i-1)*1/step;
    
    if meth==1
        wi=1./((guess^2./var_x)+1./var_y);
        wixi=x.*wi;
        wiyi=y.*wi;
        x_bar=sum(wixi)/sum(wi);
        y_bar=sum(wiyi)/sum(wi);
        z_B=wi.*((x-x_bar)./var_y+guess.*(y-y_bar)./var_x);
    elseif meth==2
        wi=1./(guess^2.*var_x+var_y);
        wixi=x.*wi;
        wiyi=y.*wi;
        x_bar=sum(wixi)/sum(wi);
        y_bar=sum(wiyi)/sum(wi);
        z_B=wi.*((x-x_bar).*var_y+guess.*(y-y_bar).*var_x);
    else
        disp(' ')
        disp('Input nr. 8 must be either 1 (=weights) or 2 (=variances)')
        disp(' ')
        return
    end
 
    wBU=wi.*z_B.*(y-y_bar);
    wBV=wi.*z_B.*(x-x_bar);

    m(i)=sum(wBU)/sum(wBV);

    b(i)=y_bar-m(i)*x_bar;

    Bw=wi.*z_B;
    w_B_diff_sqrt=wi.*(z_B-sum(Bw)/sum(wi)).^2;

    S(i,:)=wi.*(y-m(i).*x-b(i)).^2;
        
    B_bar=sum(Bw)/sum(wi);
    
    GOF(i)=sum(S(i,:))/(length(x)-2);
    
    err_m(i)=sqrt(1/sum(w_B_diff_sqrt))*sqrt(GOF(i));
    
    err_b(i)=sqrt(1/sum(wi)+(x_bar+B_bar)^2/sum(w_B_diff_sqrt))*sqrt(GOF(i));

    difference(i,:)=[guess,sqrt((guess-m(i)).^2)];

end

if fig == 1
    figure
    plot(difference(:,1),difference(:,2))
    ylim([0 5])
    title({'If the output "slope" corresponds to asymptotic behaviour,';'or seems otherwise not reasonable, try to change the input limits for the slope'})
    xlabel('Slope value')
    ylabel('Difference of the guessed and "double-check" slopes')
end

[val ind]=min(difference(:,2)) ;

slope=difference(ind,1);

intercept=b(ind);

m_err=err_m(ind);

b_err=err_b(ind);

Goodness=GOF(ind);
end