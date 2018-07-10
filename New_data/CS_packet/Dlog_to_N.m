function [output]=Dlog_to_N(input);
% converts a sum-matrix from dN/dlogDp to a absolute number concentartion
% matrix, using a slight approximation
% input in form (30x145) or something like that;

kaan=0;
if any(input(1:2,1)),
   input=input';
%   disp('k‰‰nnettiin');
   kaan=1;
   if any(input(1:2,1)),
      disp('impossible error!')
      return;
   end;
   
end;

[ri sar]=size(input);




dp=input(3:ri,1);
lkm=ri-2;
vali=ones(lkm,1);
for bi=2:lkm
   vpist(bi)=dp(bi-1)+0.5*(dp(bi)-dp(bi-1));
end;
vpist(lkm+1)=dp(lkm)+(dp(lkm)-vpist(lkm));
vpist(1)=dp(1)-(vpist(2)-dp(1));
logpist=log10(vpist);
vali(:)=diff(logpist);           % dlogDp  jonkin verran approksimoiden

uus=input;
for i=2:sar,
  uus(3:ri,i)=input(3:ri,i).*vali;
end;

if kaan
   uus=uus';
end;

output=uus;


   

