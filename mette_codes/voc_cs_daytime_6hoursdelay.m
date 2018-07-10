close all;
%clear all;
%% import data
%This dataset (2014) has a measurement for every 3 hour.
% Temperature, RH, O3 and NOx have been measured once every hour
% column 1 - 6 is the year, month, date, hour, minute, sec

CS_file  = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\Hyde_Condensation_sink_1996_2016.dat']);
voc_2014 = importdata('ptrms_ppbv_2014_42_qc.dat');
temp_2014=load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\temp_2014.txt']);
rh_2014=importdata('RH_2014.txt');
o3_2014=importdata('o3_2014.txt');
nox_2014=importdata('nox_2014.txt');

%% Select which hours you want to look at
hours=[8:3:17]';

%% datenum calculations
% datenum_voc = datenum(voc_2014(2:end,1:6));

%Finding the index
[datevec_voc,~,ind]= unique(voc_2014(2:end,1:4),'rows'); % find data for every hour
%mono_median = grpstats(voc_2014(2:end,27),ind,'nanmedian'); % make medians

%Mean value of monoterpenes based on hours
mono_median_h = grpstats(voc_2014(2:end,27),ind,'nanmedian'); % make medians
datenum_voc=datenum([datevec_voc,zeros(length(datevec_voc),2)]); %create corresponding time in datenum format

datenum_temp = datenum(temp_2014(:,1:6)); %temperature
datenum_rh   = datenum(rh_2014(:,1:6));%relative humidity
datenum_o3 = datenum(o3_2014(:,1:6)); %O3 
datenum_nox = datenum(nox_2014(:,1:6)); %NOx

%% median CS
min60=datenum(0,0,0,1,0,0);
median_cs=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
    h_idx=find(CS_file(:,1)>=datenum_voc(nvoc,1) & CS_file(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        median_cs(nvoc,1)=nanmedian(CS_file(h_idx,2));
    end
end

%% median temperature
%uses 'min60' from %% median CS
median_temp=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
    h_idx_t=find(datenum_temp(:,1)>=datenum_voc(nvoc,1) & datenum_temp(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_t)
        median_temp(nvoc,1)=nanmedian(temp_2014(h_idx_t,7));
    end
end

%% Median RH
%uses 'min60' from %% median CS
rh_median=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
   h_idx_rh=find(datenum_rh(:,1)>=datenum_voc(nvoc,1) & datenum_rh(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_rh)
        rh_median(nvoc,1)=nanmean(rh_2014(h_idx_rh,7));
    end
end

%% Median O3
%uses 'min60' from %% median CS
o3_median=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
   h_idx_o3=find(datenum_o3(:,1)>=datenum_voc(nvoc,1) & datenum_o3(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_o3)
        o3_median(nvoc,1)=nanmean(o3_2014(h_idx_o3,7));
    end
end

%% Median NOx
%uses 'min60' from %% median CS
nox_median=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
   h_idx_nox=find(datenum_nox(:,1)>=datenum_voc(nvoc,1) & datenum_nox(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_nox)
        nox_median(nvoc,1)=nanmean(nox_2014(h_idx_nox,7));
    end
end

%% Index for summer months and daytime
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);

%% Scatter plots summer season 2014
% scatter plot hours 
summer_hour_2014 = plot_scatter(mono_median_h,1,summer_idx,median_cs,1,summer_idx+2,datevec_voc,4,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','jet','Hour')

% scatter plot temperature 
summer_temp_2014 = plot_scatter(mono_median_h,1,summer_idx,median_cs,1,summer_idx+2,median_temp,1,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','jet','Temperature [^oC]')

% scatter plot RH 
summer_rh_2014 = plot_scatter(mono_median_h,1,summer_idx,median_cs,1,summer_idx+2,rh_median,1,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','jet','RH')

% scatter plot O3
summer_o3_2014 = plot_scatter(mono_median_h,1,summer_idx,median_cs,1,summer_idx+2,o3_median,1,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','parula','O_3 [ppb]')

% scatter plot NOx
summer_nox_2014 = plot_scatter(mono_median_h,1,summer_idx,median_cs,1,summer_idx+2,nox_median,1,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','parula','NO_x [ppb]')

%% further restricted plots
mono_median_summer=mono_median_h(summer_idx,1);
cs_median_summer=nox_median(summer_idx,1);


% scatter plot NOx < 1.5ppb
nox_median_summer=nox_median(summer_idx,1);
idx_nox_summer =find(nox_median_summer(:,1)<=1.5);
summer_nox015_2014 = plot_scatter(mono_median_summer,1,idx_nox_summer(1:end-2),cs_median_summer,1,idx_nox_summer(3:end),nox_median_summer,1,idx_nox_summer(1:end-2),'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','hsv','NO_x [ppb]')

% scatter plot temperature: <10,<20,<30
%The summer idx is used on the median monoterpenes, cs, and temperature.
median_temp_summer=median_temp(summer_idx,1); 
%Makes idx's for temperature
summer_idx_10_t=find(median_temp_summer(:,1)<10);
summer_idx_20_t=find(median_temp_summer(:,1)>=10 & median_temp_summer(:,1)<20);
summer_idx_30_t=find(median_temp_summer(:,1)>=20 & median_temp_summer(:,1)<30);

summer_temp10_2014 = plot_scatter(mono_median_summer,1,summer_idx_10_t(1:end-2),cs_median_summer,1,summer_idx_10_t(3:end),median_temp_summer,1,summer_idx_10_t(1:end-2),'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','winter','Temperature [^oC]')
summer_temp20_2014 = plot_scatter(mono_median_summer,1,summer_idx_20_t(1:end-2),cs_median_summer,1,summer_idx_20_t(3:end),median_temp_summer,1,summer_idx_20_t(1:end-2),'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','summer','Temperature [^oC]')
summer_temp30_2014 = plot_scatter(mono_median_summer,1,summer_idx_30_t(1:end-2),cs_median_summer,1,summer_idx_30_t(3:end),median_temp_summer,1,summer_idx_30_t(1:end-2),'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','autumn','Temperature [^oC]')


%% Function for plotting scatter plots
%[correlation_parameters]
function [correlation_parameters]=plot_scatter(data1_median,data1_column,index_data1,data2_median,data2_column,index_data2,data_cb,data_cb_column,index_data_cb,figure_name,xlabel_name,ylabel_name,cm_look,colorbar_name)

figure; hold on;
scatter(data1_median(index_data1,data1_column),data2_median(index_data2,data2_column),50,data_cb(index_data_cb,data_cb_column),'filled');
title(figure_name)
xlabel(xlabel_name,'FontSize',16,'FontWeight','bold','Color','k')
ylabel(ylabel_name,'FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap(cm_look)
cb = colorbar;
ylabel(cb,colorbar_name,'fontsize',16,'fontweight','b')

[r,p]=corr(log10(data1_median(index_data1,data1_column)),log10(data2_median(index_data2,data2_column)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 

correlation_parameters = [r;p] % Returns to main program
end
