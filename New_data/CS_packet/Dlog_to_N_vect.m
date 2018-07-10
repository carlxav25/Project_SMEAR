function [Dp, N]=Dlog_to_N(Dp, dN);



dN = dN(:)';




lkm=length(Dp);
vali=ones(lkm,1);
for bi=2:lkm
   vpist(bi)=Dp(bi-1)+0.5*(Dp(bi)-Dp(bi-1));
end;

vpist(lkm+1)=Dp(lkm)+(Dp(lkm)-vpist(lkm));
vpist(1)=Dp(1)-(vpist(2)-Dp(1));
logpist=log10(vpist);
vali(:)=diff(logpist);           % dlogDp  jonkin verran approksimoiden

N = dN.*vali(:)';



   

