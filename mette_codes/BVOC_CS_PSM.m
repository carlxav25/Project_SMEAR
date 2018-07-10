close all;
clear all;
%% import data
%This dataset (2014) has a measurement for every 3 hour.
voc_2014 = importdata('ptrms_ppbv_2014_42_qc.dat');
%CS data from 1996 to 2016. Data for every hour.
CS_file  = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\Hyde_Condensation_sink_1996_2016.dat']);
%
% Import of the psm files
psm_path='C:\Users\mette\Documents\MATLAB\Hyytiälä\PSM\';
psm_files=get_list(psm_path, 'PSM*.dat');
%the data is imported and saved in the matrix psm_data
psm_data=[];
for nf=1:length(psm_files)
    curr_file=psm_files{nf};
    psm_file=load([psm_path,curr_file]);
    if nf==1
        sizes=psm_file(1,:);
    end
    psm_file(1,:)=[];
    psm_data=[psm_data; psm_file];
end

%% Write the hours you want to look at
hours=[11:3:17]';

%% The months you want to study
month=[3 4 5]';

%% Datenum calculations
voc_2014(voc_2014(:,27)<0,27)=nan;
psm_data(psm_data(:,2:end)<0,2:end)=nan;

%Finding the index
[datevec_voc,~,ind]= unique(voc_2014(2:end,1:4),'rows'); % find data for every hour

%Mean value of monoterpenes based on hours
mono_median_h = grpstats(voc_2014(2:end,27),ind,'nanmedian'); % make medians
datenum_voc=datenum([datevec_voc,zeros(length(datevec_voc),2)]); %create corresponding time in datenum format

datenum_psm = psm_data(:,1); %cluster psm data

%% Median CS
min60=datenum(0,0,0,1,0,0);
cs_median=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
    h_idx=find(CS_file(:,1)>=datenum_voc(nvoc,1) & CS_file(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        cs_median(nvoc,1)=nanmedian(CS_file(h_idx,2));
    end
end

%% Median cluster
%uses 'min60' from %% median CS

% psm_median=nan(length(mono_median_h),5);
% for c_psm=2:1:6
% for nvoc=1:length(mono_median_h)
%     h_idx_psm=find(datenum_psm(:,1)>=datenum_voc(nvoc,1) & datenum_psm(:,1)<datenum_voc(nvoc,1)+min60);
%     if ~isempty(h_idx_psm)
%         psm_median(nvoc,(c_psm-1))=nanmedian(psm_data(h_idx_psm,c_psm));
%         
%     end
% end
% end
%%
psm_median=nan(length(mono_median_h),5);
for nvoc=1:length(mono_median_h)
    
    h_idx_psm=find(datenum_psm(:,1)>=datenum_voc(nvoc,1) & datenum_psm(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_psm)
        psm_median(nvoc,:)=nanmedian(psm_data(h_idx_psm,2:end),1); %<- the last number decides if it should calculate for columns (1) or rows (2)! That is why this median has 5 columns instead of one!
    end
end
%One median for concentrations
psm_median_total=[];
for allpsm=1:length(psm_median)
    psm_sum=sum(psm_median(allpsm,:));
    psm_median_total=[psm_median_total;psm_sum];
end 


%% Spring index
spring_idx=find(datevec_voc(:,2)>=month(1,1) & datevec_voc(:,2)<=month(end,1) & datevec_voc(:,4)>=hours(1,1) & datevec_voc(:,4)<=hours(end,1));

%% Plots
%The plot below is ([monoterpene],[cluster]) and has a line for each
%size bin

figure;
hold on;
scatter(mono_median_h(spring_idx,1),psm_median(spring_idx,5),'o','filled')
scatter(mono_median_h(spring_idx,1),psm_median(spring_idx,4),'v','filled')
scatter(mono_median_h(spring_idx,1),psm_median(spring_idx,3),'s','filled')
scatter(mono_median_h(spring_idx,1),psm_median(spring_idx,2),'d','filled')
scatter(mono_median_h(spring_idx,1),psm_median(spring_idx,1),80,'p','filled')
title('BVOC vs Cluster')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('Cluster concentration [cm^-^3]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
legend('Dp = 1-1.2 nm','Dp = 1.2-1.4 nm','Dp = 1.4-1.6 nm','Dp = 1.6-2 nm','Dp = 2-3 nm','Location','eastoutside','Orientation','vertical')


%% Scatter plot
% For concentrations:
plot_scatter(mono_median_h,1,cs_median,1,spring_idx,log10(psm_median_total),1,'BVOC vs CS spring 2014','Monoterpene [ppb]','CS [s^-^1]','jet','Cluster [cm^-^3]')


