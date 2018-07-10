function[outDp, outdN] = GFparam(Dp,dN,RH)
% function[outDp, outdN] = GFparam(Dp,dN,RH)
%
% Creates a humid size distribution for Hyytiälä using the parametrization
% of Lauri Laakso et al, ACP, Page(s) 1933-1943. SRef-ID: 1680-7324/acp/2004-4-1933, 2004.
% Rh over 99 are set to 99.
% (c) Miikka Dal Maso

bb = find(dN<0);
dN(bb) = 0;

gg = find(RH>99);
RH(gg) = 99;

gamma = GF_gamma_lauri(Dp);

GF = (1-(RH./100)).^(gamma);
[tr N] = Dlog_to_N_vect(Dp,dN);

GF_Dp = Dp.*GF;

N_cum = cumsum(N);

% with dense interpolation

dens = logspace(log10(min(Dp)./10),log10(max(Dp).*10),100); % dense
dgamma = GF_gamma_lauri(dens);
densGF =   (1-(RH./100)).^(dgamma);

densN = interp1(Dp,dN,dens);

% padding at the start and end to avoid NaNs

stix = find(isnan(densN));
densN(stix) = 0;

enix = find(isnan(densN));
densN(enix) = 0;

% cumulative distribution

[tr densN_real] = Dlog_to_N_vect(dens,densN);

densN_real_cum = cumsum(densN_real);

GFdens = dens.*densGF;

% getting the dN back

newdN = diff(densN_real_cum)./diff(log10(dens));
newdNGF = diff(densN_real_cum)./diff(log10(GFdens));

for i = 1:length(newdN)
	newdens(i)   = sqrt(dens(i).*dens(i+1));
	newGFdens(i) = sqrt(GFdens(i).*GFdens(i+1));
end


outDp = logspace(log10(min(Dp)),log10(max(GF_Dp).*2),length(Dp));

try
outdN = interp1(newGFdens,newdNGF,outDp);
catch
keyboard
end

% checking the number matching:

oldNtot = integrate_distribution(Dp,dN,1e-9,100e-6);
newNtot = integrate_distribution(outDp,outdN,1e-9,100e-6);

badness = (abs(oldNtot-newNtot)./oldNtot);
if badness>0.05,
	fprintf('Big difference in concentrations! Badness = %3.3g%%\n',badness)
end
% if this number gets big, something is wrong with the integration!
