% Autumn school 2017 pre-exercise solution
% Ava
%% load the data
% 1st method
dat = importdata('matlab_exdata_2012field_course.dat');
% 2nd method
% dat = load('matlab_exdata_2012field_course.dat');

%% convert the time into day of year format 
% 1st method
t = datenum(num2str(dat(:,1)),'yyyymmddHHMMSS');
ts = num2str(dat(1,1));
doy = t-datenum([str2num(ts(1:4)) 0 0]);

% 2nd method
% doy_pre = floor(rem(dat(:,1),10^8)/10^6);
% m = floor(rem(dat(:,1),10^10)/10^8);
% doy = 0;
% for i = 1:max(m)
% in = find(m==i);
% doy_m = doy_pre(in);
% doy = [doy;doy(end)+doy_m];
% end
% doy(1) = [];

%% calculate daily means 
[doy_mean,~,idoy] = unique(floor(doy),'rows');

% 1st method
T_mean = grpstats(dat(:,3),idoy,'nanmean');
SO2_mean = grpstats(dat(:,2),idoy,'nanmean');

% 2nd method
% T_mean = []; SO2_mean = [];
% 
% for i = 1:length(doy_mean)
%    T_mean(end+1) = nanmean(dat(doy==i,3)); 
%    SO2_mean(end+1) = nanmean(dat(doy==i,2)); 
% end

%% plotyy
% figure
% [h,ax1,ax2] = plotyy(doy_mean,SO2_mean,doy_mean,T_mean);
% ylabel(h(1),'SO_2 [ppb]','fontsize',14,'fontweight','b')
% ylabel(h(2),'T [^oC]','fontsize',14,'fontweight','b')
% xlabel(gca,'Day of Year','fontsize',14,'fontweight','b')
% grid on
% xlim(h(1),[0 datenum([2006 3 31])-datenum([2006 0 0])])
% xlim(h(2),[0 datenum([2006 3 31])-datenum([2006 0 0])])
% set(gca,'xtick',[0:10:90])
% set(h(2),'ycolor','g')
% set(ax2,'color','g')

% in newer version of Matlab (2016b->) 
figure
yyaxis('left')
plot(doy_mean,SO2_mean,'linewidth',2)
xlim([0 datenum([2006 3 31])-datenum([2006 0 0])])
ylabel(gca,'SO_2 [ppb]','fontsize',16,'fontweight','b')
yyaxis('right')
set(gca,'ycolor',[0.4 0.6 0.2])
plot(doy_mean,T_mean,'color',[0.4 0.6 0.2],'linewidth',2)
ylabel(gca,'T [^oC]','fontsize',16,'fontweight','b')
xlabel(gca,'Day of Year','fontsize',16,'fontweight','b')
grid on
xlim([0 datenum([2006 3 31])-datenum([2006 0 0])])
set(gca,'xtick',[0:10:90])
set(gca,'fontsize',14)

%% calculate hourly means 
tv =datevec(t);
[~,~,itv] = unique(tv(:,1:4),'rows');

T_mean_h = grpstats(dat(:,3),itv,'nanmean');
SO2_mean_h = grpstats(dat(:,2),itv,'nanmean');
m_h = grpstats(tv(:,2),itv,'nanmean');

%% scatter

figure
plot(T_mean_h,SO2_mean_h,'o')
grid on
xlabel(gca,'T [^oC]','fontsize',16,'fontweight','b')
ylabel(gca,'SO_2 [ppb]','fontsize',16,'fontweight','b')
set(gca,'fontsize',14)

figure
scatter(T_mean_h,SO2_mean_h,18,m_h,'o')
grid on
xlabel(gca,'T [^oC]','fontsize',16,'fontweight','b')
ylabel(gca,'SO_2 [ppb]','fontsize',16,'fontweight','b')
set(gca,'fontsize',14)

colormap('jet')
cb = colorbar;
ylabel(cb,'Month','fontsize',16,'fontweight','b')
set(cb,'ytick',1:6)
%% --------- diurnal plots -----------

SO2_d = reshape(dat(:,2),48,size(dat(:,2),1)/48);
T_d = reshape(dat(:,3),48,size(dat(:,2),1)/48);

SO2_d_med = nanmedian(SO2_d,2);
T_d_med = nanmedian(T_d,2);

t_d = t(1:48)-datenum([2006 1 1]);

figure
yyaxis('left')
plot(t_d,SO2_d_med,'linewidth',2)
xlim([0 1])
ylabel(gca,'SO_2 [ppb]','fontsize',16,'fontweight','b')
yyaxis('right')
set(gca,'ycolor',[0.4 0.6 0.2])
plot(t_d,T_d_med,'color',[0.4 0.6 0.2],'linewidth',2)
ylabel(gca,'T [^oC]','fontsize',16,'fontweight','b')
xlabel(gca,'Time','fontsize',16,'fontweight','b')
grid on
xlim([0 1])
datetick('x','hh','keepticks','keeplimits')
set(gca,'fontsize',14)

%% some small things

colormap('hsv') % good for diurnal/seasonal cycles
ylabel(gca,'SO_{22} [ppb]','fontsize',16,'fontweight','b')
SO2h = dat(tv(:,4)==1|tv(:,4)==2,2); 
SO2m = dat(tv(:,3)>=2&tv(:,3)<=4,2); 

x = diff(t); % to check if data has equal intervals
min(t)
max(t)
%% load several data files into a single variable
a = dir('PATH/FILENAME*'); % * = anything is changing, e.g. 1,2,3
b = [];

for i = 1:length(a)
   c = importdata(['PATH/' a(i).name]); 
   b = [b;c];
end

