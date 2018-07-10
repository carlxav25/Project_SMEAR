close all
clear all
clc

%% import data
% column 1 - 6 is the year, month, date, hour, minute, sec

% voc_2016 = importdata('Mastdata_VOC_2016.txt');
% voc_2017 = importdata('Mastdata_VOC_2017.txt');
CS_file  = load(['/home/carltonx/Documents/Smear_course/Hyde_Condensation_sink_1996_2016.dat']);
voc_2014 = importdata('ptrms_ppbv_2014_42_qc.dat');


t = datenum(voc_2014(2:end,1:6));
tv = datevec(t);

%% cs data fro 2014
cs_tvec = datevec(CS_file(:,1)); 
ddd = find(cs_tvec(:,1) == 2014) ;
cs_2014 = CS_file(ddd, :);
cs_new=[cs_tvec(ddd,:),CS_file(ddd,2)];

min60=datenum(0,00,0,1,0,0);

%% data selection for june-august
ddd_ja = find(cs_new(:,2) >= 6 & cs_new(:,2) <= 8 );
cs_ja = cs_new(ddd_ja,:);  
cs_dn = datenum(cs_ja(:,1:6));
cs_ja(:,8) =cs_dn;

id_ja = find(voc_2014(:,2) >= 6 & voc_2014(:,2) <= 8 );
voc_ja = voc_2014(id_ja,:);  
voc_dn = datenum(voc_ja(:,1:6));
voc_ja(:,28) =voc_dn;

% ave_cs = nan(length(voc_ja));
% for nn = 1:length(voc_ja)
%      inn = find(cs_dn >= voc_dn(nn,1) & cs_dn <= (voc_dn(nn,1) + min60));
% end



%% daily avg for july
% id_ju = find(cs_new(:,2) == 7 );
% cs_july = cs_new(id_ju,:);  


% ave_cs=nan(length(voc_dn),1);
% for n = 1:length(voc_dn)
%    idn=find(cs_dn==voc_dn(n,1));
%    if ~isempty(idn)
%        ave_cs(n,1)=nanmean(cs_ja(idn,1));
% end

%% daily variation of cs
[~,~,ind_ja]= unique(cs_ja(:,1:3),'rows'); % indices for hourly variations
cs_ja_d = grpstats(cs_ja(:,7),ind_ja,'nanmedian'); % avg over hour
cs_m_d = grpstats(cs_ja(:,3),ind_ja,'nanmedian'); 


%% hourly variations for monoterpenes
[~,~,ind]= unique(voc_ja(:,1:4),'rows'); % indices for hourly variations
mono_mean_h = grpstats(voc_ja(:,27),ind,'nanmedian'); % avg over hour nanmean for mean
m_h = grpstats(voc_ja(:,4),ind,'nanmedian'); 


%% monthly variations for monoterpenes
[~,~,ind_m]= unique(voc_2014(2:end,1:2),'rows'); % indices for monthly variations
mono_mean_m = grpstats(voc_2014(2:end,27),ind_m,'nanmean'); % avg over the month
m_m = grpstats(tv(:,2),ind_m,'nanmean'); % 


%% cs hourly variation
% [~,~,ind_csm]= unique(cs_tvec(ddd,1:4),'rows'); % indicies for hourly avg
% cs   = grpstats(cs_2014(:,2),ind_csm,'nanmean'); %cs 
% cs_h = grpstats(cs_new(:,4),ind_csm,'nanmean'); % 

%% cs june-august hourly variation
[~,~,ind_csm]= unique(cs_ja(:,1:4),'rows'); % indicies for hourly avg
cs   = grpstats(cs_ja(:,7),ind_csm,'nanmedian'); %cs 
cs_h = grpstats(cs_ja(:,4),ind_csm,'nanmedian'); % 

%% july
%  [~,~,ind_ju]= unique(cs_july(:,1:3),'rows'); % indicies for hourly avg
%  cs_14_ju   = grpstats(cs_july(:,7),ind_ju,'nanmean'); %cs 
%  cs_h_ju = grpstats(cs_july(:,3),ind_ju,'nanmean'); %

 ave_cs = nan(length(voc_2014),1);
 for n_m = 1:length(voc_2014)
     idex = find(datenum(cs_2014)>= datennum(voc_2014(n_m,1)) & datenum(cs_2014)<=voc_2014(n_m,1)+min60)
     
 
plotting_function(m_h(2:end),mono_mean_h(2:end),'Hour','Monoterpene','o','Hourly averages')



%% Calculate average diurnal cycle
hours=unique(m_h);
diur_ave=nan(length(hours),1);
for nh=1:length(hours)
    idx=find(m_h==hours(nh));
    diur_ave(nh,1)=nanmean(mono_mean_h(idx,1));
end


plotting_function(hours,diur_ave,'Hour','Monoterpene','-','diurnal averages')

%% calculate the mean monthly cycle
month=unique(m_m);
mon_ave=nan(length(month),1);
for nm=1:length(month)
    idx_m=find(m_m==month(nm));
    mon_ave(nm,1)=nanmean(mono_mean_m(idx_m,1));
end

plotting_function(month,mon_ave,'Month','Monoterpene Avg','-',' averages')

%% diurnal cycle for cs
hours_cs=unique(cs_h);
cs_diur_ave=nan(length(hours_cs),1);
for nh_cs=1:length(hours_cs)
    idx_cs=find(cs_h==hours_cs(nh_cs));
    cs_diur_ave(nh_cs,1)=nanmean(cs(idx_cs,1));
end

%% monthly cycle for cs -- new

daily_cs=unique(cs_m_d);
cs_daily=nan(length(daily_cs),1);
for n_cs=1:length(daily_cs)
    idx_ju=find(cs_m_d==daily_cs(n_cs));
    cs_daily(n_cs,1)=nanmean(cs_ja_d(idx_ju,1));
end

plotting_function(daily_cs,cs_daily,'Day','CS','-',' averages')

plotting_function(hours_cs,cs_diur_ave,'Hour','CS','-',' averages')

%% 

% hours=unique(m_h);
% cs_14_ja=[];
% for nh=1:length(hours)
%     idx_ja=find(cs_ja(:,4)==hours(nh));
%     cs_14_ja=[cs_14_ja;cs_ja(idx_ja,:)];
% end


%%

function plotting_function(datax,datay,x_name,y_name,marker,name_figure)
figure;
hold on;
title(name_figure)
plot(datax,datay,marker)
xlabel(x_name)
ylabel(y_name)
end