close all;
clear all;

%% import data
%This dataset (2014) has a measurement for every 3 hour.
% column 1 - 6 is the year, month, date, hour, minute, sec

% voc_2016 = importdata('Mastdata_VOC_2016.txt');
% voc_2017 = importdata('Mastdata_VOC_2017.txt');
CS_file  = load(['/home/local/carltonx/Documents/Smear_course/Hyde_Condensation_sink_1996_2016.dat']);
voc_2014 = load(['/home/local/carltonx/Documents/Smear_course/ptrms_ppbv_2014_42_qc.dat']);
section_analysis=load('sector_analysis.mat'); %% reading .mat file
sect= struct2array(section_analysis); % converting from struct to array
temp_2014= load('/home/local/carltonx/Documents/Smear_course/temp_2014.txt');
o3_2014= load('/home/local/carltonx/Documents/Smear_course/o3_2104.txt');


%% Calculate median hourly VOC
 datenum_temp = datenum(temp_2014(:,1:6));
 datenum_o3 = datenum(o3_2014(:,1:6));

%Finding the index
[datevec_voc,~,ind]= unique(voc_2014(2:end,1:4),'rows'); % find data for every hour
%Mean value of monoterpenes based on hours
mono_median_h = grpstats(voc_2014(2:end,27),ind,'nanmedian'); % make medians
datenum_voc=datenum([datevec_voc,zeros(length(datevec_voc),2)]); %create corresponding time in datenum format

datenum_sect=datevec(sect(:,1));


%% average CS
min60=datenum(0,0,0,1,0,0);
median_cs=nan(length(mono_median_h),1);
temp=nan(length(mono_median_h),1);


for nvoc=1:length(mono_median_h)
    h_idx=find(CS_file(:,1)>=datenum_voc(nvoc,1) & CS_file(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        median_cs(nvoc,1)=nanmedian(CS_file(h_idx,2));
    end
end

for nvoc=1:length(mono_median_h)
   h_idx_t=find(datenum_temp(:,1)>=datenum_voc(nvoc,1) & datenum_temp(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_t)
        temp(nvoc,1)=nanmedian(temp_2014(h_idx_t,7));
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


hours=[8:3:17]';




%%
hours=[11:3:17]';
start_month = 6; end_month = 8;
 
summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8);
%common_id = find(datevec_voc(summer_idx,3)==datenum_sect(:,3) & datevec_voc(summer_idx,4)==datenum_sect(:,4));
summer_data=datevec_voc(summer_idx,:);

%% matching time for trajactories--cs/voc
voc_cs_main=[datevec_voc(summer_idx,1:4),mono_median_h(summer_idx,:),median_cs(summer_idx,:),temp(summer_idx,:),o3_median(summer_idx,:)]; % 1:4 - time, 5-monoterpenes,6-cs.
traj_file=[datenum_sect(:,1:4),sect(:,3),sect(:,4)]; % 1:4 - time, 5-time over land, 6-area code.
t1=array2table(voc_cs_main(:,:));
t2=array2table(traj_file(:,:));
table_values=innerjoin(t2,t1,'Keys',1:4);
convert_table=table2array(table_values); %1;4 -time 5-time over land,6-codes,7-mono,8-cs; 


%%
% [overlap,ia,ib]=intersect(sect(:,1),datenum_voc(:,1));
%%

sector_names={'Multiple sectors';'Clean air';'Russia'; 'Europe'};
sector_markers={'*';'o';'s';'d'};
legend_names={'Multiple sectors';'Clean air';'Russia'; 'Europe'};
cls = {'r';'b';'k';'c'};
figure('Position',[1 1 1200 1000]);
% filled={'';'';'filled';'filled'};
four_colors=[rgb('Crimson');rgb('Peru');rgb('SeaGreen');rgb('Amethyst')];
for nsec=1:length(sector_names)
    sec_idx=[];
    sec_idx=find(convert_table(:,6)==nsec-1 & convert_table(:,4)>=hours(1) & convert_table(:,4)<=hours(end));
        
    scatter((convert_table(sec_idx,7)),(convert_table(sec_idx,8)),80,convert_table(sec_idx,6),sector_markers{nsec},...
        'markerfacecolor',four_colors(nsec,:),'markeredgecolor',four_colors(nsec,:))
    hold on
   

end
      
   ylim([0.001,0.015]) 
   xlim([0.01, 2])
      grid on
 set(gca,'xscale','log')
 set(gca,'yscale','log')
title('CS vs Monoterpene summer 2010')
ylabel('CS [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('Moneterpene [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
legend('Multiple sectors','Clean air','Russia', 'Europe')

% colormap('jet')
cb = colorbar;
% ylabel(cb,'Sectors','fontsize',16,'fontweight','b')
four_colors=jet(4);
four_colors=[rgb('Crimson');rgb('Peru');rgb('SeaGreen');rgb('Amethyst')];
colormap(four_colors);
% caxis([])
cb.Ticks=3/4*[1:4]-3/8;
cb.TickLabels={'Multiple sectors';'Clean air';'Russia'; 'Europe'};
ax_pos=get(gca,'position');
ax_pos(3)=ax_pos(3)*0.85;   
set(gca,'position',ax_pos);
 set(gcf,'PaperPositionMode','auto');
 print test_fig.png -dpng -r200;
 
 %% Scatter plots for each sector, colored by
 
 for nsec=2:length(sector_names)
     figure('Position',[1 1 1000 1000]);
     
    sec_idx=[];
    sec_idx=find(convert_table(:,6)==nsec-1 & convert_table(:,4)>=hours(1) & convert_table(:,4)<=hours(end) & convert_table(:,7)>0 & convert_table(:,8)>0);
     x=log10(convert_table(sec_idx,7));
     y=log10(convert_table(sec_idx,8));
          
          
   scatter(log10(convert_table(sec_idx,7)),log10(convert_table(sec_idx,8)),80,convert_table(sec_idx,5), sector_markers{nsec},'filled');
   hold on
%         set(gca,'xscale','log')
%         set(gca,'yscale','log')
          [pp,sp]=polyfit(x,y,1);
        vall = polyval(pp,x); 
        
      plot(x, vall,'k-','linewidth',2);
%       %hold on 
 ylim([-3 -1.6])
 xlim([-2 0.2])
 
  slope(nsec)=pp(1);
cross_corr=corrcoef(x,y);
coor(nsec)=cross_corr(1,2);

title([sector_names{nsec}, ', ','CS vs Monoterpene summer 2014'])
ylabel('log(CS) [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('log(Moneterpene) [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')

bivar(nsec)=bivariate(log10(convert_table(sec_idx,7)),log10(convert_table(sec_idx,8)),0,3)
grid on
colormap('jet');
cb = colorbar;
ylabel(cb,'Time over land','fontsize',16,'fontweight','b')
caxis([0 96])
ax_pos=get(gca,'position');
ax_pos(3)=ax_pos(3)*1.0;   
set(gca,'position',ax_pos);
 
%  slopes(nsec)=P(2);
%  coeff(nsec)=s.coeffcorr(1,2);
%  s_p(nsec)=s.p(2,:);
 set(gcf,'PaperPositionMode','auto');
     
    plot_name=[sector_names{nsec},'.png'];
    print(plot_name,'-dpng','-r200');
    hold off
 end
 
