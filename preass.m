close all
clear all
clc

co2_file  = load(['/home/carltonx/Documents/Smear_course/CO2_data.txt']);
ntot_file = load(['/home/carltonx/Documents/Smear_course/Ntot.txt']);

%kk = datenum(co2(:,1:6));
day  = 152 ;
co2  = co2_file(:,7);
ntot = ntot_file(:,7);

for j = 1:1440
         time(j) = (j/48 - 1/48) + day;
   end

 figure(1)
 clf
 box on
 set(gca, 'fontsize', [16], 'linewidth', [2])
 hold on
 yyaxis left
 plot(time, co2,'k','linewidth',2)
 xlabel('Time (Julian day)')
 cb = colorbar;
 colormap('jet')
 ylabel('CO_2 (umol^-^2s^-^1)')
 
 yyaxis right
 plot(time,ntot,'r')
 xlabel('Time (Julian day)')
 ylabel('Ntot (cm^-^3)')
 legend('CO_2','Ntot')
 
 [~,~,in] = unique(co2_file(:,1:3), 'rows');
 
 t_d = grpstats(co2_file(:,end),co2_file(:,4),'nanmean');
 
 [~,~,in] = unique(co2_file(:,4));
 t_dh = grpstats(co2_file(:,end),in,'nanmean');
 
 