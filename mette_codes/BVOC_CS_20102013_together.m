close all;
clear all;

%% import data
% Temperature, RH, O3 and NOx have been measured once every hour
% column 1 - 6 is the year, month, date, hour, minute, sec

CS_file  = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\Hyde_Condensation_sink_1996_2016.dat']);
voc_all = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\voc_2010_2013.txt']);
temp_all=load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\temp_20102013.txt']);
%rh_all=importdata('rh_20102013.txt');
o3_all=importdata('o3_20102013.txt');
nox_all=importdata('nox_20102013.txt');

%% Write the hours you want to look at
hours=[11:1:17]'; %We have data for every hour
%% The months you want to study
month=[6 7 8]';

%% Removes negative values from the monoterpene data 
%Removes negative values from the monoterpene data     
        voc_all(voc_all(:,7)<0,7)=nan;
        
%% Datenum 

[date_voc,~,ind] = unique(voc_all(:,1:4),'rows'); % find data for every hour
mono_median = grpstats(voc_all(:,7),ind,'nanmedian'); % make medians
datenum_voc = datenum([date_voc,zeros(length(date_voc),2)]);%create corresponding time in datenum format
        
datenum_temp = datenum(temp_all(:,1:6)); %temperature
%datenum_rh = datenum(rh_all(:,1:6)); %relative humidity
datenum_o3 = datenum(o3_all(:,1:6)); %O3 
datenum_nox = datenum(nox_all(:,1:6)); %NOx

%% Medians
        % cs median
        cs_median=nan(length(mono_median),1);
        for nh=1:length(mono_median)
            cs_median_idx=find(CS_file(:,1)>=datenum_voc(nh,1) & CS_file(:,1)<datenum_voc(nh,1)+1/24);
            if ~isempty(cs_median_idx)
                cs_median(nh,1)=nanmedian(CS_file(cs_median_idx,2));
            end
        end
        % removes cs outliers for 2013
        cs_median(cs_median(:,1)<0.0002,1)=nan;
        %        
        %
        % temp median
         temp_median=nan(length(mono_median),1);
         for nvoc=1:length(mono_median)
             temp_median_idx = find(datenum_temp(:,1)>=datenum_voc(nvoc,1) & datenum_temp(:,1)<datenum_voc(nvoc,1)+1/24); % & temp_all(:,2)>=month(1,1) & temp_all(:,2)<=month(end,1)); %earlier we added +60 min - here???
             if ~isempty(temp_median_idx)
                 temp_median(nvoc,1) = nanmedian(temp_all(temp_median_idx,7));
             end 
         end
        %
        % rh median
         %rh_median=nan(length(mono_median_y),1);
         %for nvoc=1:length(mono_median_y)
         %    rh_median_idx=find(datenum_rh(:,1)>=datenum_voc(nvoc,1) & datenum_rh(:,1)<datenum_voc(nvoc,1)+1/24);
         %    if ~isempty(rh_median_idx)
         %        rh_median(nvoc,1)=nanmean(rh_all(rh_median_idx,7));
         %    end
         %end 
        %
        % o3 median
         o3_median=nan(length(mono_median),1);
         for nvoc=1:length(mono_median)
             o3_median_idx=find(datenum_o3(:,1)>=datenum_voc(nvoc,1) & datenum_o3(:,1)<datenum_voc(nvoc,1)+1/24);
             if ~isempty(o3_median_idx)
                 o3_median(nvoc,1)=nanmean(o3_all(o3_median_idx,7));
             end
         end
         %
         % nox median
         nox_median=nan(length(mono_median),1);
         for nvoc=1:length(mono_median)
             nox_median_idx=find(datenum_nox(:,1)>=datenum_voc(nvoc,1) & datenum_nox(:,1)<datenum_voc(nvoc,1)+1/24);
             if ~isempty(nox_median_idx)
                 nox_median(nvoc,1)=nanmean(nox_all(nox_median_idx,7));
             end
         end
%% Index for summer months and daytime
summer_idx=find(date_voc(:,2)>=month(1,1) & date_voc(:,2)<=month(end,1) & date_voc(:,4)>=hours(1,1) & date_voc(:,4)<=(hours(end,1)));

%% Scatter plots summer season 2014
% scatter plot hours 
summer_hour = plot_scatter(mono_median,1,summer_idx,cs_median,1,summer_idx,date_voc,4,summer_idx,'BVOC vs CS summer','Monoterpene [ppb]','CS [s^-^1]','jet','Hour')

% scatter plot temperature 
summer_temp= plot_scatter(mono_median,1,summer_idx,cs_median,1,summer_idx,temp_median,1,summer_idx,'BVOC vs CS summer','Monoterpene [ppb]','CS [s^-^1]','jet','Temperature [^oC]')

% scatter plot O3
summer_o3 = plot_scatter(mono_median,1,summer_idx,cs_median,1,summer_idx,o3_median,1,summer_idx,'BVOC vs CS summer','Monoterpene [ppb]','CS [s^-^1]','parula','O_3 [ppb]')


        % Time delay for temp
        %1 hour
        summer_temp_1hr = plot_scatter(mono_median,1,summer_idx(1:end-1),cs_median,1,summer_idx(2:end),temp_median,1,summer_idx(1:end-1),'BVOC vs CS summer (1 hr delay)','Monoterpene [ppb]','CS [s^-^1]','jet','Temperature [^oC]')
        %2 hour
        summer_temp_2hrs = plot_scatter(mono_median,1,summer_idx(1:end-2),cs_median,1,summer_idx(3:end),temp_median,1,summer_idx(1:end-2),'BVOC vs CS summer (2 hrs delay)','Monoterpene [ppb]','CS [s^-^1]','jet','Temperature [^oC]')
        %3 hours
        summer_temp_3hrs = plot_scatter(mono_median,1,summer_idx(1:end-3),cs_median,1,summer_idx(4:end),temp_median,1,summer_idx(1:end-3),'BVOC vs CS summer (3 hrs delay)','Monoterpene [ppb]','CS [s^-^1]','jet','Temperature [^oC]')

for i=1:4
    x=mono_median(summer_idx(i:end-1),1);
    y= cs_median(summer_idx(i+1:end),1);

    position_nan_mono=find(isnan(x));
    x(isnan(x))=[];
    y(position_nan_mono)=[];
    position_nan_cs=find(isnan(y));
    y(isnan(y))=[];
    x(position_nan_cs)=[];
    i
    [P_fit,s_fit]=polyfit(log10(x),log10(y),1)         

end
        
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
%plot(log10(x),pv,'k')

[r,p]=corr(log10(data1_median(index_data1,data1_column)),log10(data2_median(index_data2,data2_column)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 

correlation_parameters = [r;p]; % Returns to main program
end        