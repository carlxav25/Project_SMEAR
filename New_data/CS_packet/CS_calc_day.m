function[out] = CS_calc_day(v,RH,temp,meth);
% calculating the condensation sink for a 
% dmps data file v
% three methods are possible: 
% meth = 1: calculating by converting v to 'real'
%           concentrations N(i), assuming the particles 
%           are all of size Dp(i), where i is the 
%           channel number
% meth = 2: calculating the CS in dCS/dlogDp and integrating 
%           over the distribution (better)
% meth = 3: using L. Laakso's parametrisation for Hyyti?l? 
%           to correct v to ambient hygroscopicity
% input 
% RH        : a 2-column vector with time and rh (1..100) 
%           in the columns [tim(:) rh(:)]
% temp      : a 2-column vector with time and temperature 
%           in the columns [tim(:) temp(:)] temp is in celsius!
%           
%           NOTE: RH and temp can also be scalar (1x1); this means
%           a constant value is used for the whole day
%           YOU MUST GIVE A VALUE FOR TEMP! RH is obligatory if meth = 3 
% v         : a matrix obtained by loading the DMPS datafile
%           to the matlab workspace

V = Dlog_to_N(v);
[ro co] = size(V);

tim = v(2:end,1);


if meth>2,
	if ~all(isnan(RH))
		if length(RH)>1,
			rhi = interp1(RH(:,1),RH(:,2),tim,'linear','extrap');
		else
			rhi = ones(size(tim)).*temp;
		end
	else
		rhi = ones(size(tim)).*NaN;
	end
end


if ~all(isnan(temp))
if length(temp)>1,
	tempi = interp1(temp(:,1),temp(:,2),tim,'linear','extrap')+273;
else
	tempi = ones(size(tim)).*temp+273;
end
else
	tempi = ones(size(tim)).*NaN;
end

% checkin if temp might be in Kelvin: 
	if any(tempi>373)
		fprintf('Serious strangeness found in CS_calc_day:\n')
		fprintf('Your ambient temperature is above the boiling point of water (T = %5.1f C)! Aborting...\n',max(temp));
		return
	end

% RH you have to take care yourself... :-)

if meth ==1,
%  method 1: calculating the old way

for i=1:length(tim)
	Dp = V(1,3:end);
	N  = V(i+1,3:end);
	CS(i) = CS_general(Dp,N,tempi(i),1.0);
end

elseif meth ==2,
%  method 2: using dCS/dlogDp

for i=1:length(tim)
	Dp = V(1,3:end);
	dN  = v(i+1,3:end);
	dCS = CS_general_dlog(Dp,dN,tempi(i),1.0);
	CS(i) = integrate_distribution(Dp,dCS,1e-9,50e-6);
end

if any(CS>0.5)
    %         tim
    %         Dp
    %         dCS
    %         CS
    disp('high CS')
    datestr(tim(1))
end

else
% method 3: correcting for growth factor

for i=1:length(tim)
	Dp = v(1,3:end);
	dN  = v(i+1,3:end);

	% rhi(i)
	% keyboard
	[GF_Dp GF_dN] = GFparam(Dp,dN,rhi(i));

	dCS = CS_general_dlog(GF_Dp,GF_dN,tempi(i),1.0);
	CS(i) = integrate_distribution(GF_Dp,dCS,1e-9,50e-6);
end


end
out = [tim(:) CS(:)];


%%
% function[out] = CS_calc_day(v,RH,temp,meth)
% % calculating the condensation sink for a
% % dmps data file v
% % three methods are possible:
% % meth = 1: calculating by converting v to 'real'
% %           concentrations N(i), assuming the particles
% %           are all of size Dp(i), where i is the
% %           channel number
% % meth = 2: calculating the CS in dCS/dlogDp and integrating
% %           over the distribution (better)
% % meth = 3: using L. Laakso's parametrisation for Hyyti?l?
% %           to correct v to ambient hygroscopicity
% % input
% % RH        : a 2-column vector with time and rh (1..100)
% %           in the columns [tim(:) rh(:)]
% % temp      : a 2-column vector with time and temperature
% %           in the columns [tim(:) temp(:)] temp is in celsius!
% %
% %           NOTE: RH and temp can also be scalar (1x1); this means
% %           a constant value is used for the whole day
% %           YOU MUST GIVE A VALUE FOR TEMP! RH is obligatory if meth = 3
% % v         : a matrix obtained by loading the DMPS datafile
% %           to the matlab workspace
% 
% % size(v)
% % v = v(:, 1:34);
% 
% V = Dlog_to_N(v);
% [ro co] = size(V);
% 
% tim = v(2:end,1);
% 
% 
% if meth>2,
%     if ~all(isnan(RH))
%         if length(RH)>1,
%             rhi = interp1(RH(:,1),RH(:,2),tim,'linear','extrap');
%         else
%             rhi = ones(size(tim)).*temp;
%         end
%     else
%         rhi = ones(size(tim)).*NaN;
%     end
% end
% % % stim = size(tim)
% if ~all(isnan(temp))
%     if length(temp)>1,
% %         tim
% %         temp(:,1)
% %         temp(:,2)
%         tempi = interp1(temp(:,1),temp(:,2),tim,'linear','extrap')+273;
%     else
%         tempi = ones(size(tim)).*temp+273;
%     end
% else
%     tempi = ones(size(tim)).*NaN;
% end
% % % sti = size(tempi)
% % checkin if temp might be in Kelvin:
% if any(tempi>373)
%     fprintf('Serious strangeness found in CS_calc_day:\n')
%     fprintf('Your ambient temperature is above the boiling point of water (T = %5.1f C)! Aborting...\n',max(temp));
%     return
% end
% 
% % RH you have to take care yourself... :-)
% 
% if meth ==1,
%     %  method 1: calculating the old way
%     
%     for i=1:length(tim)
%         Dp = V(1,3:end);
%         N  = V(i+1,3:end);
%         CS(i) = CS_general(Dp,N,tempi(i),1.0);
%     end
%     
% elseif meth ==2,
%     %  method 2: using dCS/dlogDp
%     
%     for i=1:length(tim)
%         Dp = V(1,3:end);
%         dN  = v(i+1,3:end);
%         dCS = CS_general_dlog(Dp,dN,tempi(i),1.0);
%         CS(i) = integrate_distribution(Dp,dCS,1e-9,50e-6);
%     end
%     
%     
% else
%     % method 3: correcting for growth factor
%     
%     for i=1:length(tim)
%         Dp = v(1,3:end);
%         dN  = v(i+1,3:end);
%         
%         % rhi(i)
%         % keyboard
%         [GF_Dp GF_dN] = GFparam(Dp,dN,rhi(i));
%         
%         dCS = CS_general_dlog(GF_Dp,GF_dN,tempi(i),1.0);
%         CS(i) = integrate_distribution(GF_Dp,dCS,1e-9,50e-6);
%     end
%     
%     
% end
% out = [tim(:) CS(:)];
