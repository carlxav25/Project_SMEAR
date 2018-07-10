close all;
clear all;
%% import data
% Temperature, RH, O3 and NOx have been measured once every hour
% column 1 - 6 is the year, month, date, hour, minute, sec

voc_all = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\voc_2010_2013.txt']);

%Proxy data is extraced from a .mat file. See proxy_20102013.m!
 proxy_file  = load('proxy_20102015.mat');
 proxy_data=struct2array(proxy_file);% The columns in the proxy file is: time, MT_proxy, k_O3*O3, k_OH*OH, k_NO3*NO3, CS, OxOrg,]
 %CS data is extraced from a .mat file. See CS_20102013.m!
 CS_file  = load('CS_20102015.mat');
 CS_data=struct2array(CS_file);% The columns in the proxy file is: time, MT_proxy, k_O3*O3, k_OH*OH, k_NO3*NO3, CS, OxOrg,]
    

%% Write the hours you want to look at
hours=[11:1:17]'; %We have data for every hour
%% The months you want to study
month=[6 7 8]';
%% The year you want to study
year=[2010 2011 2012 2013]';

%% The time resolution
time_resolution_voc=1/24;
time_resolution_proxy=1/24/2;
%% Datenum calculations
voc_all(voc_all(:,7)<0,7)=nan;
proxy_data(proxy_data(:,6)<0,2)=nan; 
% 

         %
% idx_y = find( voc_all(:,1)==year(1,1) & voc_all(:,1)==year(end,1));% & voc_all(:,2)>=month(1,1) & voc_all(:,2)<=month(end,1) & voc_all(:,4)>=hours(1,1) & voc_all(:,4)>=hours(end,1));
% voc_data = voc_all(idx_y,:);
% proxy_datenum=datevec([proxy_data(:,1)]);
% idx_y_proxy = find(proxy_datenum(:,1)==year(1,1) & proxy_datenum(:,1)==year(end,1) &);
% proxy_y=proxy_data(idx_y,:);
         %
         % datenum voc
         [date_voc,~,ind] = unique(voc_all(:,1:4),'rows'); % find data for every hour
         mono_median = grpstats(voc_all(:,7),ind,'nanmedian'); % make medians
         datenum_voc = datenum([date_voc,zeros(length(date_voc),2)]);%create corresponding time in datenum format
         
         % cs median voc
         cs_median=nan(length(mono_median),1);
         for nh=1:length(mono_median)
             cs_median_idx=find(CS_data(:,1)>=datenum_voc(nh,1) & CS_data(:,1)<datenum_voc(nh,1)+time_resolution_voc);
             if ~isempty(cs_median_idx)
                 cs_median(nh,1)=nanmedian(CS_data(cs_median_idx,2));
             end
         end
         cs_median(cs_median(:,1)<0.0002,1)=nan;
         
       % datenum proxy
         proxy_datenum=datevec([proxy_data(:,1)]);
         proxy_use=[proxy_datenum proxy_data(:,6)]; %contains datevec and the data we want to use
         [date_proxy,~,ind] = unique(proxy_use(:,1:5),'rows'); % find data for every hour
         proxy_median = grpstats(proxy_use(:,7),ind,'nanmedian'); % make medians
         datenum_proxy = datenum([date_proxy,zeros(length(date_proxy),1)]);%create corresponding time in datenum format
         
         
         %proxy median from #/cm^3 to ppb
         proxy_median=proxy_median(:,1).*10^9./(2.46*10^(19));
         
         % cs median proxy
         cs_median_proxy=nan(length(proxy_median),1);
         for nh=1:length(proxy_median)
             cs_median_idx=find(CS_data(:,1)>=datenum_proxy(nh,1) & CS_data(:,1)<datenum_proxy(nh,1)+time_resolution_proxy);
             if ~isempty(cs_median_idx)
                 cs_median_proxy(nh,1)=nanmedian(CS_data(cs_median_idx,2));
             end
         end  
                
         cs_median_proxy(cs_median_proxy(:,1)<0.0002,1)=nan;
         
         figure
         hold on
         plot((proxy_median(:,1)),(cs_median_proxy(:,1)),'x')

 summer_idx_voc=find(date_voc(:,1)>=year(1,1) & date_voc(:,1)<=year(end,1) & date_voc(:,2)>=month(1,1) & date_voc(:,2)<=month(end,1) & date_voc(:,4)>=hours(1,1) & date_voc(:,4)<=(hours(end,1)));
 summer_idx_pro=find(date_proxy(:,1)>=year(1,1) & date_proxy(:,1)<=year(end,1) & date_proxy(:,2)>=month(1,1) & date_proxy(:,2)<=month(end,1) & date_proxy(:,4)>=hours(1,1) & date_proxy(:,4)<=(hours(end,1)));%& date_proxy(:,4)>=hours(1,1) & date_proxy(:,4)<=(hours(end,1)));

 %% plots
 
 
figure;
hold on;
plot(mono_median(summer_idx_voc,1),cs_median(summer_idx_voc,1),'o')
plot(proxy_median(summer_idx_pro,1),cs_median_proxy(summer_idx_pro,1),'x')


x=mono_median(summer_idx_voc,1);
y= cs_median(summer_idx_voc,1);
nanidx=find(isnan(x) | isnan(y));
x(nanidx,:)=[];
y(nanidx,:)=[];
[P_fit,s_fit]=polyfit(log10(x),log10(y),1)
pv=polyval(P_fit,log10(x));

x_proxy=proxy_median(summer_idx_pro,1);
y_proxy= cs_median_proxy(summer_idx_pro,1);
nanidx_proxy=find(isnan(x_proxy) | isnan(y_proxy));
x_proxy(nanidx_proxy,:)=[];
y_proxy(nanidx_proxy,:)=[];
[P_fit_proxy,s_fit_proxy]=polyfit(log10(x_proxy),log10(y_proxy),1)
pv_proxy=polyval(P_fit_proxy,log10(x_proxy));
title('Measurements and proxies vs CS')
xlabel('Monoterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold','Xscale','log','yscale','log')
loglog(x,10.^pv,'b','Linewidth',2)
loglog(x_proxy,10.^pv_proxy,'r','Linewidth',2)
legend('Measurements', 'Proxies','Location','northwest');

[r_proxies,p]=corr(log10(mono_median(summer_idx_voc,1)),log10(cs_median(summer_idx_voc,1)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 

[r_measured,p]=corr(log10(proxy_median(summer_idx_pro,1)),log10(cs_median_proxy(summer_idx_pro,1)),'rows','complete'); %r is the linear correlation coefficient, p is the p-value 
 