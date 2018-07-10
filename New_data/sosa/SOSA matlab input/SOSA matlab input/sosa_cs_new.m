% program calculates the condensation and coagulation sinks as half hour average values
% by using the functions CoagS_general and CS_general. The equations are from the paper
% "On the formation, growth and composition of nucleation mode particles" (Kulmala et al.)

clear all;
close all;

YEAR = input('Year:  ', 's');
year = eval(YEAR);

if year == 2017, num_month = 2; else num_month = 12; end

if year == 2004, mastdays = 366; 
elseif year == 2008, mastdays = 366; 
%elseif year == 2013, mastdays =181; 
else mastdays = 365; end   


%*****************************************************************************************************************************************
%*********** M A S T *********************************************************************************************************************
%*****************************************************************************************************************************************



for j = 1:mastdays
    for i = 1:48
        tim_mast(i,j)  = time(i+48*j-48); 
        rh_mast(i,j)   = rh(i+48*j-48);
        tem_mast(i,j)  = temp4(i+48*j-48); 
        if rh_mast(i,j) > 90, rh_mast(i,j) = 90.; end
        if rh_mast(i,j) < 30, rh_mast(i,j) = 30.; end
    end
end


%*****************************************************************************************************************************************
%*****************************************************************************************************************************************
%*****************************************************************************************************************************************
% Start of the loop for every day


for mo = 1:num_month
   if mo == 1,  s = 1; k_end = 31; end
   if mo == 2,  s = 1; 
       if year == 2004 || year == 2008, k_end = 29; 
       else k_end = 28; 
       end 
   end
   if mo == 3,  s = 1; k_end = 31; end
   if mo == 4,  s = 1; k_end = 30; end
   if mo == 5,  s = 1; k_end = 31; end
   if mo == 6,  s = 1; k_end = 30; end
   if mo == 7,  s = 1; k_end = 31; end
   if mo == 8,  s = 1; k_end = 31; end
   if mo == 9,  s = 1; k_end = 30; end
   if mo == 10, s = 1; k_end = 31; end
   if mo == 11, s = 1; k_end = 30; end
   if mo == 12, s = 1; k_end = 31; end

         % Calculating the cs values from the dmps-sum file - Hyytiala
         [x1, y1] = size(part');
         dmpx = y1-2;
         dmpy = x1-1;
         for k = 1:dmpx
             dmps_dia(k) = part(1,k+2);
             dmps_dia_old(k) = dmps_dia(k);
             for i = 1:dmpy
                 dmps_tim(i)   = (part(i,1));
                 dmps_tot(i)   = part(i,2);
                 dmps_num(k,i) = part(i,k+1);
             end
         end


         % Interpolating particle to mast-time skale
         for k = 1:dmpx
             dmps_numI(k,:) = interp1(dmps_tim, dmps_num(k,:), tim_mast(:,julian), 'linear');
         end

         % Calcuating the growth function for different humidities based on Lauris results
         for i = 1:48
             cs_par_dmps_day(i) = 1;
             for m = 1:dmpx    
                 GrfL(m,i)    = (1-rh_mast(i,julian)/100)^(-3.11E5*dmps_dia(m)-0.0847);   % Lauri
                 if dmps_dia(m) > 3E-7, GrfL(m,i) = GrfL(m-1,i); end
             end
             for m = dmpx:-1:1    
                 if dmps_dia(m) < 10E-8, GrfL(m,i) = GrfL(m+1,i); end
                 dmps_diaL(m)   = GrfL(m,i) * dmps_dia(m);     
             end
         end
      
         % Change dmps data from dN/dlogDp to N/cm3 and calculate cs
         dmps_numN = par_conversion(dmps_numI, dmps_dia);
         for i = 1:48
             dmps_numT(i) = sum(dmps_numN(:,i));
             
             par_3_6_nm(i) = 0.; par_6_10_nm(i) = 0.;
             for m = 1:dmpx
                 if dmps_dia(m) < 6E-9, par_3_6_nm(i) = par_3_6_nm(i) + dmps_numN(m,i); end
                 if dmps_dia(m) > 6E-9 && dmps_dia(m) < 1E-8, par_6_10_nm(i) = par_6_10_nm(i) + dmps_numN(m,i); end
             end

             cs_d(i)      = sosa_cs_sa(dmps_dia, dmps_numN(:,i), tem_mast(i,julian), 1);
             cs_dL(i)     = sosa_cs_na(dmps_diaL, dmps_numN(:,i), tem_mast(i,julian), 1);  

             if rh_mast(i,julian) < 60
                ch_dL(i) = cs_dL(i)/1000;
             else
                ch_dL(i) = cs_dL(i)/1000 + cs_dL(i)*(rh_mast(i,julian)-60)*2.5/1000;
             end
             ch_dL(i)     = sosa_cs_na(dmps_diaL, dmps_numN(:,i), tem_mast(i,julian), 1);
             coa_d(i)    = sosa_coa_lim_cluster(1, dmps_dia, dmps_numN(:,i), tem_mast(i,julian),1);
         end
      else
         cs_dmean = mean(cs_d); cs_dmeanL = mean(cs_dL); ch_dmeanL = mean(ch_dL); coa_dmean = mean(coa_d); 
         par_3_6_nm_mean = mean(par_3_6_nm); par_6_10_nm_mean = mean(par_6_10_nm);
         dmps_dia = dmps_dia_old;
         for i = 1:48
             cs_d(i) = cs_dmean; cs_dL(i) = cs_dmeanL; ch_dL(i) = ch_dmeanL; coa_d(i) = coa_dmean;
             par_3_6_nm(i) = par_3_6_nm_mean; par_6_10_nm(i) = par_6_10_nm_mean;
             cs_par_dmps_day(i) = 2;
         end
      end

      % Starting with APS data
      filena2   = ['aps20' date1 '.sum'];
      filename2 = [filepath2 filena2];
      lf2       = length(filena2);
     
      if exist(filename2) == 1
         aps       = load(filename2);

         % Calculating the cs values from the aps-sum file - Hyytiala
         apx = y2-2;
         apy = x2-1;
         [x2, y2] = size(aps');
         for k = 1:y2-2
             aps_dia(k) = aps(1,k+2);
             for i = 1:x2-1
                 aps_tim(i)   = aps(i,1);
                 aps_tot(i)   = aps(i,2);
                 aps_num(k,i) = aps(i,k+1);
             end
         end


         % Interpolating particle to mast-time skale
         for k = 1:apx
             aps_numI(k,:) = interp1(aps_tim, aps_num(k,:), tim_mast(:,julian), 'linear');
         end

         % Calcuating the growth function for different humidities based on Lauris results
         for i = 1:48
             cs_par_aps_day(i) = 1;
             for m = 1:apx    
                 GrfL(m,i)    = (1-rh_mast(i,julian)/100)^(-3.11E5*aps_dia(m)-0.0847);   % Lauri
                 if aps_dia(m) > 6E-7, GrfL(m,i) = GrfL(m-1,i); end
             end
             for m = apx:-1:1    
                if aps_dia(m) < 10E-8, GrfL(m,i) = GrfL(m+1,i); end
                aps_diaL(m)   = GrfL(m,i) * aps_dia(m);     
             end
         end

         % Change aps data from dN/dlogDp to N/cm3 and calculate surface area
         aps_numN = par_conversion(aps_numI, aps_dia);
         for i = 1:48
             k = 1; kL = 1;
             for f = 1:apx
                 if aps_dia(f) >= dmps_dia(dmpx)
                    aps_diaN(k)    = aps_dia(f);
                    aps_numNN(k,i) = aps_numN(f,i);
                    k = k+1;
                 end
             end
             for f = 1:apx
                 if aps_diaL(f) >= dmps_dia(dmpx)
                    aps_diaNL(kL)    = aps_diaL(f);
                    kL = kL+1;
                 end
             end
             cs_a(i)  = sosa_cs_sa(aps_diaN,  aps_numNN(:,i), tem_mast(i,julian), 1);  
             cs_aL(i) = sosa_cs_na(aps_diaNL, aps_numNN(:,i), tem_mast(i,julian), 1);  
  
             if rh_mast(i,julian) < 60
                ch_aL(i) = cs_aL(i)/1000;
             else
                ch_aL(i) = cs_aL(i)/1000 + cs_aL(i)*(rh_mast(i,julian)-60)*2.5/1000;
             end
             ch_aL(i) = sosa_cs_na(aps_diaNL, aps_numNN(:,i), tem_mast(i,julian), 1);
             coa_a(i)    = sosa_coa_lim_cluster(1, aps_dia, aps_numN(:,i), tem_mast(i,julian),1);
         end
      elseif year == 2003
         for i = 1:48
             cs_par_aps_day(i) = 2;
             cs_a(i) = 0.; cs_aL(i) = 0.; ch_aL(i) = 0.; coa_a(i) = 0.;
         end
      elseif year == 2004 && mo < 6 && j < 3
         for i = 1:48
             cs_par_aps_day(i) = 2;
             cs_a(i) = 0.; cs_aL(i) = 0.; ch_aL(i) = 0.; coa_a(i) = 0.;
         end
      else
         cs_mean = mean(cs_a); cs_meanL = mean(cs_aL); ch_meanL = mean(ch_aL); coa_mean = mean(coa_a);
         for i = 1:48
             cs_par_aps_day(i) = 2;
             cs_a(i) = cs_mean; cs_aL(i) = cs_meanL; ch_aL(i) = ch_meanL; coa_a(i) = coa_mean;
         end
      end

      for i = 1:48
          cs_tim(i+julian*48-48) = tim_mast(i,julian);
          cs_dmp(i+julian*48-48) = cs_d(i);
          cs_aps(i+julian*48-48) = cs_a(i);
          cs_dmpL(i+julian*48-48) = cs_dL(i);
          cs_apsL(i+julian*48-48) = cs_aL(i);
          ch_dmpL(i+julian*48-48) = ch_dL(i);
          ch_apsL(i+julian*48-48) = ch_aL(i);
          cs_par_dmps(i+julian*48-48) = cs_par_dmps_day(i);
          cs_par_aps(i+julian*48-48) = cs_par_aps_day(i);

          coa_dmp(i+julian*48-48) = coa_d(i);
          coa_aps(i+julian*48-48) = coa_a(i);
          
          par_3_6_NM(i+julian*48-48)  = par_3_6_nm(i);
          par_6_10_NM(i+julian*48-48) = par_6_10_nm(i);
      end
      clear dmps_tim aps_tim dmps_num dmps_dia aps_num aps_dia dmps_numI aps_numI 
   end
end
   
for j = 1:length(cs_tim)
    if cs_dmp(j) == 0
       cs_dmp(j)  = mean(cs_dmp(j-49:j-1));
       cs_dmpL(j) = mean(cs_dmpL(j-49:j-1));
       ch_dmpL(j) = mean(ch_dmpL(j-49:j-1));
       coa_dmp(j) = mean(coa_dmp(j-49:j-1));
    end
    if (cs_aps(j) == 0. && j > 50)
       cs_aps(j)  = mean(cs_aps(j-49:j-1));
       cs_apsL(j) = mean(cs_apsL(j-49:j-1));
       ch_apsL(j) = mean(ch_apsL(j-49:j-1));
       coa_aps(j) = mean(coa_aps(j-49:j-1));
    elseif (cs_aps(j) == 0. && j < 50)
       cs_aps(j)  = 1.E-4;
       cs_apsL(j) = 1.1E-4;
       ch_apsL(j) = 1.1E-4;
       coa_aps(j) = 1.E-6;
    end
    cs_sum(j)   = cs_dmp(j)   + cs_aps(j);
    cs_sumL(j)  = cs_dmpL(j)  + cs_apsL(j);
    ch_sumL(j)  = ch_dmpL(j)  + ch_apsL(j);
    coa_sum(j)  = coa_dmp(j)  + coa_aps(j);
end


figure(1)
clf
hold on
plot(cs_tim, cs_dmp, 'r-')
plot(cs_tim, cs_aps, 'b-')
plot(cs_tim, cs_sum, 'k-')
plot(cs_tim, cs_dmpL, 'r--')
plot(cs_tim, cs_apsL, 'b--')
plot(cs_tim, cs_sumL, 'k--')
for i = 1:length(cs_tim)
    if cs_par_dmps(i) == 2, plot(cs_tim(i), cs_par_dmps(i)/50, 'ko'); end
    if cs_par_aps(i) == 2, plot(cs_tim(i), cs_par_aps(i)/50, 'kx'); end
end
legend('cs-dmps', 'cs-aps', 'cs-sum', 'cs-dmps-rh-cor', 'cs-aps-rh-cor', 'cs-sum-rh-cor');
title(['Year:  ', num2str(year)])



figure(2)
clf
hold on
plot(cs_tim, cs_sum, 'r-')
plot(cs_tim, cs_sumL, 'b-')
plot(cs_tim, ch_sumL, 'k-')
for i = 1:length(cs_tim)
    if cs_par_dmps(i) == 2, plot(cs_tim(i), cs_par_dmps(i)/50, 'ko'); end
    if cs_par_aps(i) == 2, plot(cs_tim(i), cs_par_aps(i)/50, 'kx'); end
end
legend('cs-sum', 'cs-sum-rh-cor', 'cs-sum-rh-cor-hno3');
title(['Year:  ', num2str(year)])



figure(3)
clf
hold on
plot(cs_tim, coa_dmp, 'r-')
plot(cs_tim, coa_aps, 'b-')
plot(cs_tim, coa_sum, 'k-')
legend('coa-dmps', 'coa-aps', 'coa-sum');
title(['Year:  ', num2str(year)])


figure(4)
clf
hold on
plot(cs_tim, par_3_6_NM, 'r-')
plot(cs_tim, par_6_10_NM, 'b-')
legend('particle 3-6 nm', 'particle 6-10 nm');
title(['Year:  ', num2str(year)])


% Output
fid1 = fopen('cs_hyy.txt','w');
   for j = 1:length(cs_sum)
       fprintf (fid1, '%10.3f',  cs_tim(j));     % date
       fprintf (fid1, '%20.8f',  cs_dmp(j));     % cs from DMPS data
       fprintf (fid1, '%20.8f',  cs_aps(j));     % cs from APS data
       fprintf (fid1, '%20.8f',  cs_sum(j));     % sum of cs values
       fprintf (fid1, '%20.8f',  cs_dmpL(j));    % cs from DMPS data with RH-correction
       fprintf (fid1, '%20.8f',  cs_apsL(j));    % cs from APS data with RH-correction
       fprintf (fid1, '%20.8f',  cs_sumL(j));    % sum of cs values with RH-correction
       fprintf (fid1, '%20.8f',  ch_dmpL(j));    % cs from DMPS data with RH-correction for HNO3
       fprintf (fid1, '%20.8f',  ch_apsL(j));    % cs from APS data with RH-correction for HNO3
       fprintf (fid1, '%20.8f',  ch_sumL(j));    % sum of cs values with RH-correction for HNO3
       fprintf (fid1, '\n');  
   end

fid2 = fopen('cs_par.txt','w');
   for j = 1:length(cs_sum)
       fprintf (fid2, '%10.3f',  cs_tim(j));     % date
       fprintf (fid2, '%8.0f',   cs_par_dmps(j));     
       fprintf (fid2, '%8.0f',   cs_par_aps(j));     
       fprintf (fid2, '%12.2f',  par_3_6_NM(j));     
       fprintf (fid2, '%12.2f',  par_6_10_NM(j));     
       fprintf (fid2, '\n');  
   end

fid3 = fopen('coa_par.txt','w');
   for j = 1:length(cs_sum)
       fprintf (fid3, '%10.3f',  cs_tim(j));     % date
       fprintf (fid3, '%16.8f',   coa_sum(j));     
       fprintf (fid3, '\n');  
   end
end

