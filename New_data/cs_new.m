close all
clear all
clc

% this is for 2016 fmi data with GC-MS
% and 2017 data for monoterpenes with PTR-MS


% reading data sequentially for each month

% cs_data_2016  = [];
% for k = 1:12 ;
%     
%     BaseName = 'M0' ;
%     fold = ['CS2016','/',BaseName,num2str(k)];
%     CS_file  = load(['/home/carltonx/Documents/Smear_course/New_data/' fold '/SMEAR_cs.txt']);
%     cs_data_2016 = [cs_data_2016 ; CS_file];
% end 
cs_file = load('/home/local/carltonx/Documents/Smear_course/New_data/CondensationSink_Hyde_1997_2017_Method3.dat');
datevec_cs = datevec(cs_file(:,1));

% summer months 2016  and 2017

ind_2016 = find(datevec_cs(:,1) == 2016 & datevec_cs(:,2) >= 6 & datevec_cs(:,2)<=8 & ....
                 datevec_cs(:,4)>=11 & datevec_cs(:,4)<= 17);

ind_2017 = find(datevec_cs(:,1) == 2017 & datevec_cs(:,2) >= 6 & datevec_cs(:,2)<=8 & ....
                 datevec_cs(:,4)>=11 & datevec_cs(:,4)<= 17);
             
cs_data_2016 = [datevec_cs(ind_2016,:), cs_file(ind_2016,2)];
cs_data_2017 = [datevec_cs(ind_2017,:), cs_file(ind_2017,2)];
             
clear ind_2016;
clear ind_2017;

% MONOTERPENES DATA 2017 - 3 hour resolution
mono_2017_data = load('/home/local/carltonx/Documents/Smear_course/Mastdata_VOC_2017.txt');
ind_42 = find(mono_2017_data(:,20)==42 & mono_2017_data(:,2) == 8 & ... %mono_2017_data(:,2) <=8 &....
               mono_2017_data(:,4) >=11 & mono_2017_data(:,4) <=17  );
Monoterpene_17 = [mono_2017_data(ind_42,1:6), mono_2017_data(ind_42,34)];
clear ind_42;

% % MONOTERPENES DATA 2016 - 3 hour resolution for comparission
mono_2016_data = load('/home/local/carltonx/Documents/Smear_course/Mastdata_VOC_2016.txt');
ind_42 = find(mono_2016_data(:,20)==42 & mono_2016_data(:,2) == 8 & ... % mono_2016_data(:,2) <=8 &....
               mono_2016_data(:,4) >=11 & mono_2016_data(:,4) <=17  );
Monoterpene_16 = [mono_2016_data(ind_42,1:6), mono_2016_data(ind_42,34)];
clear ind_42;

% ind_42    = find(mono_2017_data(:,20)==42);
% Mono_fdiu = [mono_2017_data(ind_42,1:6), mono_2017_data(ind_42,34)];

%calculating hourly median for 2017
[datevec_voc,~,ind]= unique(Monoterpene_17(:,1:4),'rows'); % find data for every hour
%Mean value of monoterpenes based on hours
mono_17 = grpstats(Monoterpene_17(:,7),ind,'nanmedian'); % make medians
datenum_voc = datenum([datevec_voc,zeros(length(datevec_voc),2)]); %create corresponding time in datenum format
clear ind ;

%calculating hourly median for 2016 Mastdata
[datevec_voc_mast,~,ind]= unique(Monoterpene_16(:,1:4),'rows'); % find data for every hour
%Mean value of monoterpenes based on hours
mono_16 = grpstats(Monoterpene_16(:,7),ind,'nanmedian'); % make medians
datenum_voc_mast = datenum([datevec_voc_mast,zeros(length(datevec_voc_mast),2)]); %create corresponding time in datenum format
clear ind ;

% for diurnal cycle
% [dv_voc,~,ind]= unique(Mono_fdiu(:,1:4),'rows'); % find data for every hour
% %Mean value of monoterpenes based on hours
% mono_fdiu = grpstats(Mono_fdiu(:,7),ind,'nanmedian'); % make medians
% dn_voc = datenum([dv_voc,zeros(length(dv_voc),2)]); %create corresponding time in datenum format
% clear ind;

%% Jaana bäck's data - 2016 
% the concentrations are in pptv

time_j  = xlsread('HydeGCMS3data2016_to_Jaana.xlsx','B3:B1255'); %time
mono_jj = xlsread('HydeGCMS3data2016_to_Jaana.xlsx','E3:Q1255'); % alpha-pinene
sesq_jj = xlsread('HydeGCMS3data2016_to_Jaana.xlsx','R3:Y1255'); % beta-carophyllene

mono_j = sum(mono_jj,2); % total monoterpene
sesq_j = sum(sesq_jj,2); % total sesquiterpene

% O3 data
o3_2016 = load('/home/carltonx/Documents/Smear_course/New_data/O3_2016.txt');
o3_2017 = load('/home/carltonx/Documents/Smear_course/New_data/O3_2017.txt');

%convert date starting from 12/30/1899
time = datevec(time_j+datenum('30-Dec-1899'));

mono_new = [time, mono_j];
sesq_new = [time(1:length(sesq_j),:), sesq_j];


%% Calculate median hourly CS 
% cs for summer months
% for summer months and afternoon time
mono_ind    = find(mono_new(:,2)==8 & mono_new(:,4)>= 11 & mono_new(:,4)<= 17); %& mono_new(:,2)<=8 
mono_summer = mono_new(mono_ind,:);

sesq_ind    = find(sesq_new(:,2)==8  & sesq_new(:,4)>=11 & sesq_new(:,4)<=17); % & sesq_new(:,2)<=8
sesq_summer = sesq_new(sesq_ind,:);

%% Calculate median hourly VOC
 %Finding the index
 
[d_mono,~,ind]= unique(mono_summer(:,1:4),'rows'); % find data for every hour
%Mean value of monoterpenes based on hours
mono_median_h = grpstats(mono_summer(:,7),ind,'nanmedian'); % make medians
datenum_mono = datenum([d_mono,zeros(length(d_mono),2)]); %create corresponding time in datenum format
clear ind;

[d_sesq,~,ind]= unique(sesq_summer(:,1:4),'rows'); % find data for every hour
%Mean value of monoterpenes based on hours
sesq_median_h = grpstats(sesq_summer(:,7),ind,'nanmedian'); % make medians
datenum_sesq = datenum([d_sesq,zeros(length(d_sesq),2)]); %create corresponding time in datenum format
clear ind;



%% average CS
min60=datenum(0,0,0,1,0,0);
cs_median=nan(length(mono_summer),1);
o3_median=nan(length(mono_summer),1);
cs_17    =nan(length(mono_17),1);
o3_17    =nan(length(mono_17),1);
cs_16    =nan(length(mono_16),1);

% for cs 2016
for nvoc=1:length(mono_median_h)
    h_idx=find(datenum(cs_data_2016(:,1:6))>=datenum_mono(nvoc,1) & datenum(cs_data_2016(:,1:6))<datenum_mono(nvoc,1)+min60);
    if ~isempty(h_idx)
        cs_median(nvoc,1)=nanmedian(cs_data_2016(h_idx,7));
    end
end
clear h_idx;

% for o3 2016
for nvoc=1:length(mono_median_h)
    h_idx=find(datenum(o3_2016(:,1:6))>=datenum_mono(nvoc,1) & datenum(o3_2016(:,1:6))<datenum_mono(nvoc,1)+min60);
    if ~isempty(h_idx)
        o3_median(nvoc,1)=nanmedian(o3_2016(h_idx,7));
    end
end
clear h_idx;

% for cs 2017
for nvoc=1:length(mono_17)
    h_idx=find(datenum(cs_data_2017(:,1:6))>=datenum_voc(nvoc,1) & datenum(cs_data_2017(:,1:6))<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        cs_17(nvoc,1)=nanmedian(cs_data_2017(h_idx,7));
    end
end
clear h_idx;

% for cd 2016 mastdata
for nvoc=1:length(mono_16)
    h_idx=find(datenum(cs_data_2016(:,1:6))>=datenum_voc_mast(nvoc,1) & datenum(cs_data_2016(:,1:6))<datenum_voc_mast(nvoc,1)+min60);
    if ~isempty(h_idx)
        cs_16(nvoc,1)=nanmedian(cs_data_2016(h_idx,7));
    end
end
clear h_idx;

% for o3 2017
for nvoc=1:length(mono_17)
    h_idx=find(datenum(o3_2017(:,1:6))>=datenum_voc(nvoc,1) & datenum(o3_2017(:,1:6))<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        o3_17(nvoc,1)=nanmedian(o3_2017(h_idx,7));
    end
end
clear h_idx;

%diurnal cycle
% hours= [1:2:23]';
% start_month=6; end_month=8;
% ave_diur_voc=nan(length(hours),1);
% for nh=1:length(hours)
%      ave_h_idx=find(dv_voc(:,2)>=start_month & dv_voc(:,2) <=end_month & dv_voc(:,4)==hours(nh,1));
%   if ~isempty(ave_h_idx)
%       ave_diur_voc(nh,1)=mean(mono_fdiu(ave_h_idx,1));
%   end
% end
% % 
% plotting_function(hours,ave_diur_voc,'Hours','Monoterpene [pptv]','-','Average diurnal cycle monoterpene 2016 summer')



%% plots 
figure('Position',[1 1 1200 1000]);
scatter((mono_median_h), (cs_median),50,'filled','k'); hold on;
scatter((mono_17*1e3), (cs_17),50,'filled','r')
scatter((mono_16*1e3), (cs_16),100,'b')
grid on
set(gca,'xscale','log')
set(gca,'yscale','log')
xlabel('log(Monoterpene)(pptv)','FontSize',16,'FontWeight','bold','Color','k')
ylabel('log(CS)','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
title('Monoterpene vs CS for August')
legend('2016 - Janna Bäck', 'Mastdata-2017','Mastdata-2016')

% x = log10(mono_median_h);
% y = log10(cs_median) ;
%  %basic fitting
% [pp,sp]=polyfit(x,y,1);
% vall = polyval(pp,x);

% plot(x,vall,'k')

% colormap('jet');
% cb = colorbar;
% ylabel(cb,'Ozone','fontsize',16,'fontweight','b')
% %caxis([10 55])
% ax_pos=get(gca,'position');
% ax_pos(3)=ax_pos(3)*1.0;   
% set(gca,'position',ax_pos);

% sesq vs cs
% figure('Position',[1 1 1200 1000]);
% scatter((sesq_median_h), (cs_median),50,'filled');hold on; %,o3_median,
% 
% grid on
% set(gca,'xscale','log')
% set(gca,'yscale','log')
% xlabel('sesquiterpenes(pptv)','FontSize',16,'FontWeight','bold','Color','k')
% ylabel('CS','FontSize',16,'FontWeight','bold','Color','k')
% set(gca,'FontSize',14,'FontWeight','bold')
% title('Sesquiterpenes vs CS 2017')
% 
% 
% colormap('jet');
% cb = colorbar;
% ylabel(cb,'Ozone','fontsize',16,'fontweight','b')
% % caxis([10 55])
% ax_pos=get(gca,'position');
% ax_pos(3)=ax_pos(3)*1.0;   
% set(gca,'position',ax_pos);

%
% figure('Position',[1 1 1200 1000]);
% scatter((mono_17), (cs_17),50, o3_17,'filled'); hold on;
% grid on
% set(gca,'xscale','log')
% set(gca,'yscale','log')
% xlabel('log(Monoterpene)(pptv)','FontSize',16,'FontWeight','bold','Color','k')
% ylabel('log(CS)','FontSize',16,'FontWeight','bold','Color','k')
% set(gca,'FontSize',14,'FontWeight','bold')
% title('Monoterpene vs CS 2017')
% 
% % x = log10(mono_17);
% % y = log10(cs_17) ;
% % % basic fitting
% % [pp,sp]=polyfit(x,y,1);
% % vall = polyval(pp,x);
% 
% %plot(x,vall,'k')
% 
% colormap('jet');
% cb = colorbar;
% ylabel(cb,'Ozone','fontsize',16,'fontweight','b')
% %caxis([10 55])
% ax_pos=get(gca,'position');
% ax_pos(3)=ax_pos(3)*1.0;   
% set(gca,'position',ax_pos);
% 
%% Plot function
function plotting_function(datax,datay,x_name,y_name,marker,name_figure)
figure('Position',[1 1 1200 1000]);
hold on;
title(name_figure,'FontSize',16,'FontWeight','bold','Color','k')
plot(datax,datay,marker)
xlabel(x_name,'FontSize',16,'FontWeight','bold','Color','k')
ylabel(y_name,'FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
grid on
end
