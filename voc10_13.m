close all;
clear all;
%% import data
%This dataset (2014) has a measurement for every 3 hour.
% column 1 - 6 is the year, month, date, hour, minute, sec

% voc_2016 = importdata('Mastdata_VOC_2016.txt');
% voc_2017 = importdata('Mastdata_VOC_2017.txt');
CS_file  = load(['/home/local/carltonx/Documents/Smear_course/Hyde_Condensation_sink_1996_2016.dat']);
voc_2014 = load(['/home/local/carltonx/Documents/Smear_course/voc_2010_2013.txt']);


%% Calculate median hourly VOC
id_10=find(voc_2014(:,1)==2010);
voc_10=voc_2014(id_10,:);

%Finding the index
[datevec_voc,~,ind]= unique(voc_2014(2:end,1:4),'rows'); % find data for every hour
%Mean value of monoterpenes based on hours
mono_median_h = grpstats(voc_2014(2:end,7),ind,'nanmedian'); % make medians
datenum_voc=datenum([datevec_voc,zeros(length(datevec_voc),2)]); %create corresponding time in datenum format



%% average CS
min60=datenum(0,0,0,1,0,0);
median_cs=nan(length(mono_median_h),1);
for nvoc=1:length(mono_median_h)
    h_idx=find(CS_file(:,1)>=datenum_voc(nvoc,1) & CS_file(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        median_cs(nvoc,1)=nanmedian(CS_file(h_idx,2));
    end
end
%% Average diurnal cycle VOC
hours=[2:3:23]';
start_month=6; end_month=8;
ave_diur_voc=nan(length(hours),1);
for nh=1:length(hours)
  ave_h_idx=find(datevec_voc(:,2)>=start_month & datevec_voc(:,2) <=end_month & datevec_voc(:,4)==hours(nh,1));
  if ~isempty(ave_h_idx)
      ave_diur_voc(nh,1)=nanmean(mono_median_h(ave_h_idx,1));
  end
end


plotting_function(hours,ave_diur_voc,'Hours','Monoterpene [nnmol/mol]','-','Average diurnal cycle VOC summer 2014')

%% Average diurnal cycle CS
hours=[2:3:23]';
start_month=6; end_month=8;
ave_diur_cs=nan(length(hours),1);
for nh_cs=1:length(hours)
  ave_h_idx_cs=find(datevec_voc(:,2)>=start_month & datevec_voc(:,2) <=end_month & datevec_voc(:,4)==hours(nh_cs,1));
  if ~isempty(ave_h_idx_cs)
      ave_diur_cs(nh_cs,1)=nanmean(median_cs(ave_h_idx_cs,1));
  end
end

plotting_function(hours,ave_diur_cs,'Hours','CS [s^-^1]','-','Average diurnal cycle CS summer 2014')

%% daily median scatter plot

hours=[2:3:23]';
month=7; day=15;
daily_median_cs=nan(length(hours),1);
daily_median_voc=nan(length(hours),1);
for nh_cs=1:length(hours)
  daily_h_idx_cs=find(datevec_voc(:,2)==month & datevec_voc(:,3) == day & datevec_voc(:,4)==hours(nh_cs,1));
  if ~isempty(daily_h_idx_cs)
      daily_median_cs(nh_cs,1)=nanmean(median_cs(daily_h_idx_cs,1));
      daily_median_voc(nh_cs,1)=nanmean(mono_median_h(daily_h_idx_cs,1));
  end
end

% scatter plot
figure;
hold on;
scatter(daily_median_cs,daily_median_voc,50,hours,'filled')

title('CS vs Monoterpene 15/7 2014')
xlabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
ylabel('Moneterpene [nmol/mol]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')

colormap('jet')
cb = colorbar;
ylabel(cb,'Hour','fontsize',16,'fontweight','b')

lsline
set(lsline,'Color', 'k','Linewidth',2)

[r,p]=corr(daily_median_cs,daily_median_voc) %r is the linear correlation coefficient, p is the p-value 



%%

% scatter plot
figure;
hold on;
%scatter(md_median_cs,md_median_voc,50,hours,'filled')
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8);
scatter(mono_median_h(summer_idx,1),median_cs(summer_idx,1),50,datevec_voc(summer_idx,4),'filled');
set(gca,'xscale','log')
set(gca,'yscale','log')

title('CS vs Monoterpene summer 2014')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('Moneterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')

colormap('jet')
cb = colorbar;
ylabel(cb,'Hour','fontsize',16,'fontweight','b')

 c1=find(~isnan(mono_median_h(summer_idx,1)));
 c2=find(~isnan(median_cs(summer_idx,1))); %indices for nans 
 
 


% b = polyfit(log10(mono_median_h(summer_idx,1)),log10(median_cs(summer_idx,1)),1);
% % % lsline
%  fit = polyval(b,mono_median_h(summer_idx,1));%exp(b(2)) .* median_cs(c1,1).^b(1);
%  hold on
%  plot(mono_median_h(summer_idx,1), fit)
%  set(pp,'Color', 'k','Linewidth',2)

% [r,p]=corr(median_cs(summer_idx,1),mono_median_h(summer_idx,1)) %r is the linear correlation coefficient, p is the p-value 

[R,P] = corr(median_cs(summer_idx,1), mono_median_h(summer_idx,1),'rows','complete')


%% Time series
%% 

%% Plot function
function plotting_function(datax,datay,x_name,y_name,marker,name_figure)
figure;
hold on;
title(name_figure,'FontSize',16,'FontWeight','bold','Color','k')
plot(datax,datay,marker)
xlabel(x_name,'FontSize',16,'FontWeight','bold','Color','k')
ylabel(y_name,'FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
end

% function [A,B]=lsline(X,Y)
% 
% %Input    - X is the 1xn abscissa vector
% %            - Y is the 1xn ordinate vector
% %Output - A is the coeefficient of x in Ax + B
% %            - B is the constant coefficient in Ax + B
% 
% 
% xmean=mean(X);
% ymean=mean(Y);
% sumx2=(X-xmean)*(X-xmean)';
% sumxy=(Y-ymean)*(X-xmean)';
% A=sumxy/sumx2;
% B=ymean-A*xmean;
% end