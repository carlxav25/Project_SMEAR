close all;
clear all;
%% import data
%This dataset (2014) has a measurement for every 3 hour.
% Temperature, RH, O3 and NOx have been measured once every hour
% column 1 - 6 is the year, month, date, hour, minute, sec

CS_file  = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\Hyde_Condensation_sink_1996_2016.dat']);
voc_2014 = importdata('ptrms_ppbv_2014_42_qc.dat');
temp_2014=load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\temp_2014.txt']);
o3_2014=importdata('o3_2014.txt');
nox_2014=importdata('nox_2014.txt');
gr_2014=importdata('global_radiance_18m_2014.txt');

%% Write the hours you want to look at
hours=[11:3:17]';

%% Datenum calculations
% datenum_voc = datenum(voc_2014(2:end,1:6));

%Finding the index
[datevec_voc,~,ind]= unique(voc_2014(2:end,1:4),'rows'); % find data for every hour

%Mean value of monoterpenes based on hours
mono_median_h = grpstats(voc_2014(2:end,27),ind,'nanmedian'); % make medians
datenum_voc=datenum([datevec_voc,zeros(length(datevec_voc),2)]); %create corresponding time in datenum format

datenum_temp = datenum(temp_2014(:,1:6)); %temperature
datenum_o3 = datenum(o3_2014(:,1:6)); %O3 
datenum_nox = datenum(nox_2014(:,1:6)); %NOx
datenum_gr = datenum(gr_2014(:,1:6)); %Global radiance

%% median CS
min60=datenum(0,0,0,1,0,0);
cs_median=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
    h_idx=find(CS_file(:,1)>=datenum_voc(nvoc,1) & CS_file(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        cs_median(nvoc,1)=nanmedian(CS_file(h_idx,2));
    end
end

%% median temperature
%uses 'min60' from %% median CS
temp_median=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
    h_idx_t=find(datenum_temp(:,1)>=datenum_voc(nvoc,1) & datenum_temp(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_t)
        temp_median(nvoc,1)=nanmedian(temp_2014(h_idx_t,7));
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

%% Median global radiance 125 m
%uses 'min60' from %% median CS
gr_median=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
   h_idx_gr=find(datenum_gr(:,1)>=datenum_voc(nvoc,1) & datenum_gr(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_gr)
        gr_median(nvoc,1)=nanmean(gr_2014(h_idx_gr,7));
    end
end

%% Index for summer months and daytime
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8 & datevec_voc(:,4)>=8 & datevec_voc(:,4)<=17);

%% Scatter plots summer season 2014
% scatter plot hours 
summer_hour_2014 = plot_scatter(mono_median_h,1,summer_idx,cs_median,1,summer_idx,datevec_voc,4,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','jet','Hour')

% scatter plot temperature 
summer_temp_2014 = plot_scatter(mono_median_h,1,summer_idx,cs_median,1,summer_idx,temp_median,1,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','jet','Temperature [^oC]')


% scatter plot O3
summer_o3_2014 = plot_scatter(mono_median_h,1,summer_idx,cs_median,1,summer_idx,o3_median,1,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','parula','O_3 [ppb]')

% scatter plot global radiation
summer_gr_2014 = plot_scatter(mono_median_h,1,summer_idx,cs_median,1,summer_idx,gr_median,1,summer_idx,'BVOC vs CS summer 2014','Monoterpene [ppb]','CS [s^-^1]','parula','Global radiance [W m^-^2]')

%% Scatter plots summer season 2014 monoterpene/NOX ratio
%mono_nox = mono_median_h./nox_median;

% scatter plot (monoterpene/NOx,CS) temperatures
%summer_mono_nox_temp_2014 = plot_scatter(mono_nox,1,summer_idx,cs_median,1,summer_idx,temp_median,1,summer_idx,'BVOC/NO_x vs CS summer 2014','Monoterpene / NO_x','CS [s^-^1]','jet','Temperature [^oC]')

% scatter plot O3
%summer_mono_nox_o3_2014 = plot_scatter(mono_nox,1,summer_id

x=mono_median_h(summer_idx,1);
y= cs_median(summer_idx,1);

position_nan_mono=find(isnan(x));
x(isnan(x))=[];
y(position_nan_mono)=[];
position_nan_cs=find(isnan(y));
y(isnan(y))=[];
x(position_nan_cs)=[];
[P_fit,s_fit]=polyfit(log10(x),log10(y),1)

%% using bivariate_pauli
% Should give slope and intercept
%[slope, intercept, m_err, b_err, Goodness]=bivariate(log10(mono_median_h(summer_idx,1)), log10(cs_median(summer_idx,1)), 0, 2)%, fig, prec, inp_var_x, inp_var_y, inp_meth)

%% Functions

function [correlation_parameters]=plot_scatter(data1_median,data1_column,index_data1,data2_median,data2_column,index_data2,data_cb,data_cb_column,index_data_cb,figure_name,xlabel_name,ylabel_name,cm_look,colorbar_name)

figure; hold on;
scatter(log10(data1_median(index_data1,data1_column)),log10(data2_median(index_data2,data2_column)),50,data_cb(index_data_cb,data_cb_column),'filled');
title(figure_name)
xlabel(xlabel_name,'FontSize',16,'FontWeight','bold','Color','k')
ylabel(ylabel_name,'FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold') %,'Xscale','log','yscale','log')
colormap(cm_look)
cb = colorbar;
ylabel(cb,colorbar_name,'fontsize',16,'fontweight','b')
x=data1_median(index_data1,1);
y= data2_median(index_data2,1);

position_nan_mono=find(isnan(x));
x(isnan(x))=[];
y(position_nan_mono)=[];
position_nan_cs=find(isnan(y));
y(isnan(y))=[];
x(position_nan_cs)=[];

[P_fit,s_fit]=polyfit(log10(x),log10(y),1);
pv=polyval(P_fit,log10(x));hours
plot(log10(x),pv,'k')

[slope, intercept, m_err, b_err, Goodness]=bivariate(log10(x), log10(y), 0, 2)%, fig, prec, inp_var_x, inp_var_y, inp_meth)

[r,p]=corr(log10(data1_median(index_data1,data1_column)),log10(data2_median(index_data2,data2_column)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 

correlation_parameters = [r;p]; % Returns to main program
end

