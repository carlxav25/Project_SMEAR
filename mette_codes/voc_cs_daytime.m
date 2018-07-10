close all;
clear all;
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
hours=[11:3:17]';

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

%% Scatter plots summer season 2014
% scatter plot hours
figure;
hold on;
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);
scatter(mono_median_h(summer_idx,1),median_cs(summer_idx,1),50,datevec_voc(summer_idx,4),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('jet')
cb = colorbar;
ylabel(cb,'Hour','fontsize',16,'fontweight','b')

[r_summer,p_summer]=corr(log10(mono_median_h(summer_idx,1)),log10(median_cs(summer_idx,1)),'rows','complete') %r is the linear correlation coefficient, p is the p-value 

% scatter plot temperature
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);
%
figure;
hold on;
scatter(mono_median_h(summer_idx,1),median_cs(summer_idx,1),50,median_temp(summer_idx,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('jet')
cb = colorbar;
ylabel(cb,'Temperature','fontsize',16,'fontweight','b')
[r_summer,p_summer]=corr(log10(mono_median_h(summer_idx,1)),log10(median_cs(summer_idx,1)),'rows','complete') %r is the linear correlation coefficient, p is the p-value 

% scatter plot RH
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);
%
figure;
hold on;
scatter(mono_median_h(summer_idx,1),median_cs(summer_idx,1),50,rh_median(summer_idx,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('jet')
cb = colorbar;
ylabel(cb,'RH','fontsize',16,'fontweight','b')
[r_summer,p_summer]=corr(log10(mono_median_h(summer_idx,1)),log10(median_cs(summer_idx,1)),'rows','complete') %r is the linear correlation coefficient, p is the p-value 

% scatter plot O3
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);
%
figure;
hold on;
scatter(mono_median_h(summer_idx,1),median_cs(summer_idx,1),50,o3_median(summer_idx,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('parula')
cb = colorbar;
ylabel(cb,'O_3 [ppb]','fontsize',16,'fontweight','b')
[r_summer_O3,p_summer_O3]=corr(log10(mono_median_h(summer_idx,1)),log10(median_cs(summer_idx,1)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 

% scatter plot NOx
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);
%
figure;
hold on;
scatter(mono_median_h(summer_idx,1),median_cs(summer_idx,1),50,nox_median(summer_idx,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('parula')
cb = colorbar;
ylabel(cb,'NO_x [ppb]','fontsize',16,'fontweight','b')
[r_summer_NOX,p_summer_NOX]=corr(log10(mono_median_h(summer_idx,1)),log10(median_cs(summer_idx,1)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 

%% Scatter plots summer season 2014 for 0-9,10-19,20-29 degrees 
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17); %Idx for the summer months

%The summer idx is used on the median monoterpenes, cs, and temperature.
mono_median_summer=mono_median_h(summer_idx,1); 
median_cs_summer=median_cs(summer_idx,1); 
median_temp_summer=median_temp(summer_idx,1); 

%Makes idx's for temperature
summer_idx_10_t=find(median_temp_summer(:,1)<10);
summer_idx_20_t=find(median_temp_summer(:,1)>=10 & median_temp_summer(:,1)<20);
summer_idx_30_t=find(median_temp_summer(:,1)>=20 & median_temp_summer(:,1)<30);

%The scatter plots are made using mono_median_summer, median_cs_summer,
%median_temp_summer, and the temperature idx's:

%10C
figure;
hold on;
scatter(mono_median_summer(summer_idx_10_t,1),median_cs_summer(summer_idx_10_t,1),50,median_temp_summer(summer_idx_10_t,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('winter')
cb = colorbar;
ylabel(cb,'Temperature','fontsize',16,'fontweight','b')
[r_summer_t10,p_summer_t10]=corr(log10(mono_median_summer(summer_idx_10_t,1)),log10(median_cs_summer(summer_idx_10_t,1)),'rows','complete')

%20C
figure;
hold on;
scatter(mono_median_summer(summer_idx_20_t,1),median_cs_summer(summer_idx_20_t,1),50,median_temp_summer(summer_idx_20_t,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('summer')
cb = colorbar;
ylabel(cb,'Temperature','fontsize',16,'fontweight','b')
[r_summer_t20,p_summer_t20]=corr(log10(mono_median_summer(summer_idx_20_t,1)),log10(median_cs_summer(summer_idx_20_t,1)),'rows','complete')

%30C
figure;
hold on;
scatter(mono_median_summer(summer_idx_30_t,1),median_cs_summer(summer_idx_30_t,1),50,median_temp_summer(summer_idx_30_t,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('autumn')
cb = colorbar;
ylabel(cb,'Temperature','fontsize',16,'fontweight','b')
[r_summer_t30,p_summer_t30]=corr(log10(mono_median_summer(summer_idx_30_t,1)),log10(median_cs_summer(summer_idx_30_t,1)),'rows','complete')

%% Scatter plot summer 2014 NOx<1.5 ppb

% scatter plot NOx
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);

nox_median_summer=nox_median(summer_idx,1);

idx_nox_summer =find(nox_median_summer(:,1)<=1.5);

%
figure;
hold on;
scatter(mono_median_h(idx_nox_summer,1),median_cs(idx_nox_summer,1),50,nox_median_summer(idx_nox_summer,1),'filled');
title('BVOC vs CS summer 2014')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
colormap('hsv')
cb = colorbar;
ylabel(cb,'NO_x [ppb]','fontsize',16,'fontweight','b')
[r_summer_NOX,p_summer_NOX]=corr(log10(mono_median_h(summer_idx,1)),log10(median_cs(summer_idx,1)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 

