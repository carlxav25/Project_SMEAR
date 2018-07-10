% Function change dNdlogDp into N/cm3

function [num_parN] = CS_general(num_par, radius)

[fx, fy] = size(num_par);

for i = 1:fy
    for j = 1:fx 
        if j == 1
           dmin1 = log10(radius(j)); 
           dmax1 = log10(radius(j)) + 0.5*(log10(radius(j+1)) - log10(radius(j)));
        elseif j == fx
           dmin1 = log10(radius(j)) - 0.5*(log10(radius(j)) - log10(radius(j-1))); 
           dmax1 = log10(radius(j));
        else
           dmin1 = log10(radius(j)) - 0.5*(log10(radius(j))   - log10(radius(j-1))); 
           dmax1 = log10(radius(j)) + 0.5*(log10(radius(j+1)) - log10(radius(j)));
        end
 
        %Dense diameter grid inside size bin
        dpi3 = [dmin1:0.01:dmax1];
        
        %Interpolating to dense grid for all time steps
        con_D = interp1(log10(radius), num_par(:,i), dpi3,'linear')*0.01;
        num_parN(j,i) = sum(con_D);
        
        if isnan(num_parN(j,i)) == 1, num_parN(j,i) = 0; end
    end
end
        