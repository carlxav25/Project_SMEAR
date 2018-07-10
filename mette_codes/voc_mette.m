close all
clear all
clc

%% import data
%This dataset (2014) has a measurement for every 3 hour.
% column 1 - 6 is the year, month, date, hour, minute, sec

% voc_2016 = importdata('Mastdata_VOC_2016.txt');
% voc_2017 = importdata('Mastdata_VOC_2017.txt');
CS_file  = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\Hyde_Condensation_sink_1996_2016.dat']);
voc_2014 = importdata('ptrms_ppbv_2014_42_qc.dat');

%% Monoterpene hourly average
%Vector
    t = datenum(voc_2014(2:end,1:6));
%Finding the index
    [~,~,ind]= unique(voc_2014(2:end,1:4),'rows');
%Mean value of monoterpenes based on hours
    mono_mean_h = grpstats(voc_2014(2:end,27),ind,'nanmean');
%Normal time
    tv = datevec(t);
%Mean value for the hours
    m_h = grpstats(tv(:,4),ind,'nanmean');
  
%plotting_function(m_h(2:end),mono_mean_h(2:end),'Hour','Monoterpene','x','Monoterpene hourly averages')
    
%% Average diurnal cycle
hours=unique(m_h);
% The average hourly diurnal cycle for 2014 is calculated using average_cycle 
    [hourly_average_cycle_2014] = average_cycle(hours,m_h,mono_mean_h);
% The data is plotted using the plotting_function
    plotting_function(hours,hourly_average_cycle_2014,'Hour','Monoterpene','-','Monoterpene daily averages 2014')
    


%---Mean monthly cycle---
%Montly variations is calculated
    [~,~,ind_m]= unique(voc_2014(2:end,1:2),'rows');
    mono_mean_m = grpstats(voc_2014(2:end,27),ind_m,'nanmean');
    m_m = grpstats(tv(:,2),ind_m,'nanmean');

%The mean montly cycle is calculated
    month=unique(m_m);
    
% The average monthly cycle is calculated using average_cycle   
    [monthly_average_cycle] = average_cycle(month,m_m,mono_mean_m);
%The monthly average for 2014 is plotted
    plotting_function(month,monthly_average_cycle,'Month','Monoterpene Avg','-',' Monthly averages from Jan to Aug 2014')

% We can see that the average monoterpene concentration is largest in juli.
% Therefore we will look at the a daily averages for Juli 2014.
%

%% Juli 2014
%---------Daily averages for Juli 2014-----

%Index for Juli
    idx_juli=find(voc_2014(:,2)==7);
%Data for Juli
    juli_data=[voc_2014(idx_juli(1):idx_juli(end),:)];
%Index for the hours and the diurnal hour means
    [~,~,idx_juli_h]= unique(juli_data(:,1:3),'rows');
    juli_mean_h = grpstats(juli_data(1:end,27),idx_juli_h,'nanmean');
%The days in the month are found
    days_31 = unique(juli_data(:,3));  
%The data is plotted:
    plotting_function(days_31,juli_mean_h,'Day','Monoterpene','-','Monoterpene daily averages Juli 2014')

% hours Juli
    t_juli=datenum(juli_data(:,1:6));
    tv_juli=datevec(t_juli);
    m_h_juli=grpstats(tv_juli(:,4),idx_juli_h,'nanmean');

%time,time_measurement,value_mean_time
    [hour_average_cycle_juli] = average_cycle(hours,m_h_juli,juli_mean_h);
% The data is plotted using the plotting_function
    plotting_function(hours,hour_average_cycle_juli,'Hour','Monoterpene','-','Monoterpene daily averages Juli 2014')

    
%% Summer season 
%Hourly avg for the summer season    
%Index for the summer season
    ss_idx=find(voc_2014(:,2)>=6 & voc_2014(:,2)<=8);
%Data for the summer season
    ss_data=[voc_2014(ss_idx(1):ss_idx(end),:)];
%Hours
    ss_hour=unique(ss_data(:,4));
%
%Finding the index
    [~,~,ss_ind]= unique(ss_data(:,1:4),'rows');
%Mean value of monoterpenes based on hours
    mono_mean_h_ss = grpstats(ss_data(:,27),ss_ind,'nanmean');

%Handling of time
    t_ss=datenum(ss_data(:,1:6));
    tv_ss=datevec(t_ss);
    m_h_ss=grpstats(tv_ss(:,4),ss_ind,'nanmean');
    
    
% The average diurnal cycle is calculated using average_cycle   
    [ss_diurnal_average] = average_cycle(ss_hour,m_h_ss,mono_mean_h_ss);
% The data is plotted using the plotting_function
    plotting_function(ss_hour,ss_diurnal_average,'Hour','Monoterpene','-','Monoterpene daily averages summer season 2014')

% all three months summer season
[C,~,idx_ss_m]=unique(ss_data(:,1:3),'rows');
ss_mean_m=grpstats(ss_data(:,27),idx_ss_m,'nanmean');

ss_days=datenum(C);

plotting_function(ss_days,ss_mean_m,'Days','Monoterpene','-','Monoterpene daily averages Juli to August 2014')

    
    

%% CS data
% cs data fro 2014
cs_tvec = datevec(CS_file(:,1)); 
ddd = find(cs_tvec(:,1) == 2014) ;
cs_2014 = CS_file(ddd, :);
cs_new=[cs_tvec(ddd,:),CS_file(ddd,2)];

%daily avg for july
id_ju = find(cs_new(:,2) == 7 );
cs_july = cs_new(id_ju,:); 

 [~,~,ind_ju]= unique(cs_july(:,1:3),'rows'); % indicies for hourly avg
 cs_14_ju   = grpstats(cs_july(:,7),ind_ju,'nanmean'); %cs 
 cs_h_ju = grpstats(cs_july(:,3),ind_ju,'nanmean'); %
 
 %monthly cycle for cs -- new
 
daily_cs=unique(cs_h_ju);
cs_daily=nan(length(daily_cs),1);
for n_cs=1:length(daily_cs)
    idx_ju=find(cs_h_ju==daily_cs(n_cs));
    cs_daily(n_cs,1)=nanmean(cs_14_ju(idx_ju,1));
end

plotting_function(daily_cs,cs_daily,'Day','CS','-',' averages')


%% scatter
figure;
hold on;
scatter(cs_daily,juli_mean_h,50,days_31,'filled')

title('CS vs Monoterpene Juli 2014')
xlabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('Moneterpene [nmol/mol]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')

colormap('jet')
cb = colorbar;
ylabel(cb,'Day','fontsize',16,'fontweight','b')

lsline
set(lsline,'Color', 'k','Linewidth',2)

[r,p]=corr(cs_daily,juli_mean_h); %r is the linear correlation coefficient, p is the p-value 
%mdl = fitlm(cs_daily, juli_mean_h);

%% combined plot
%A combined figure of monoterpene and CS:
    figure;
    hold on;
    title('Comparison of Monoterpene Concentration and CS Juli 2014');
    yyaxis left;
    %plot(hours,juli_mean_h);
    yyaxis right;
    plot(daily_cs,cs_daily);
%
    xlabel('Hours','FontSize',16,'FontWeight','bold','Color','k');
    yyaxis left;
    ylabel('Monoterpene [nmol/mol]','FontSize',16,'FontWeight','bold','Color','k');
    yyaxis right;
    ylabel('Monoterpene[nmol/mol]','FontSize',16,'FontWeight','bold','Color','k');
  
    


%% Functions
function plotting_function(datax,datay,x_name,y_name,marker,name_figure)
figure;
hold on;
title(name_figure,'FontSize',16,'FontWeight','bold','Color','k')
plot(datax,datay,marker)
xlabel(x_name,'FontSize',16,'FontWeight','bold','Color','k')
ylabel(y_name,'FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
end

function [averages] = average_cycle(time,time_measurement,value_mean_time)
%---Calculate average diurnal cycle---
diur_ave=nan(length(time),1); % Generation of an empty vector that has the same length as the number of hours 
for i=1:length(time);
    idx=find(time_measurement==time(i)); %The indexs for the single hour that we are calculating the average for
    diur_average(i,1)=nanmean(value_mean_time(idx,1)); %The mean value for the selected hour is calculated (without nan)
end

averages=diur_average; %The vector with the calculated diurnal averages are returned to the main program

end


