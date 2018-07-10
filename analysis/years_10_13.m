close all;
clear all;


%% import data

CS_file  = load(['/home/local/carltonx/Documents/Smear_course/Hyde_Condensation_sink_1996_2016.dat']);
voc_10_13 = load(['/home/local/carltonx/Documents/Smear_course/voc_2010_2013.txt']);
section_analysis=load('sector_analysis_data.mat'); %% reading .mat file
sect= struct2array(section_analysis); % converting from struct to array
o3_10_13= load('/home/local/carltonx/Documents/Smear_course/analysis/SV%3a_Re%3a/o3_20102013.txt');
table_2014=load('convert_table.mat');
tab_14= struct2array(table_2014);
temp_10_13= load('/home/local/carltonx/Documents/Smear_course/analysis/SV%3a_Re%3a/temp_20102013.txt');


 %% data for each year and summer months
 voc_ind=find(voc_10_13(:,2)>=6 & voc_10_13(:,2)<=8);
 voc=voc_10_13(voc_ind,:);
 
 o3_ind=find(o3_10_13(:,2)>=6 & o3_10_13(:,2)<=8);
 o3_data=o3_10_13(o3_ind,:);

 temp_ind=find(temp_10_13(:,2)>=6 & temp_10_13(:,2)<=8);
 temp_data=temp_10_13(temp_ind,:);
 
 o3_ind=find(temp_10_13(:,2)>=6 & temp_10_13(:,2)<=8);
 o3_data=o3_10_13(o3_ind,:);
 
%  datenum_sect_struct=datevec(sect_struct(:,1));

 %sect_ind=find(datenum_sect_struct(:,1)==year);
 %sect=sect_struct(sect_ind,:);
 datenum_sect=datevec(sect(:,1));
 
%% Calculate median hourly VOC
 datenum_temp = datenum(temp_data(:,1:6));
 datenum_o3 = datenum(o3_data(:,1:6));
 
 %Finding the index
[datevec_voc,~,ind]= unique(voc(:,1:4),'rows'); % find data for every hour
%Mean value of monoterpenes based on hours
mono_median_h = grpstats(voc(:,7),ind,'nanmedian'); % make medians
datenum_voc=datenum([datevec_voc,zeros(length(datevec_voc),2)]); %create corresponding time in datenum format

% datenum_sect=datevec(sect(:,1));


%% average CS
min60=datenum(0,0,0,1,0,0);
median_cs=nan(length(mono_median_h),1);
o3=nan(length(mono_median_h),1);
temp=nan(length(mono_median_h),1);

for nvoc=1:length(mono_median_h)
    h_idx=find(CS_file(:,1)>=datenum_voc(nvoc,1) & CS_file(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx)
        median_cs(nvoc,1)=nanmedian(CS_file(h_idx,2));
    end
end

for nvoc=1:length(mono_median_h)
   h_idx_o3=find(datenum_o3(:,1)>=datenum_voc(nvoc,1) & datenum_o3(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_o3)
        o3(nvoc,1)=nanmedian(o3_data(h_idx_o3,7));
    end
end

for nvoc=1:length(mono_median_h)
   h_idx_t=find(datenum_temp(:,1)>=datenum_voc(nvoc,1) & datenum_temp(:,1)<datenum_voc(nvoc,1)+min60);
    if ~isempty(h_idx_t)
        temp(nvoc,1)=(temp_data(h_idx_t,7));
    end
end
  
%%
hours=[11:1:17]';
start_month = 6; end_month = 8;
 
%summer_idx=find(datevec_voc(:,2)>=6 & datevec_voc(:,2)<=8);
%summer_data=datevec_voc(summer_idx,:);

%% matching time for trajactories--cs/voc
%voc_cs_main=[datevec_voc(summer_idx,1:4),mono_median_h(summer_idx,:),median_cs(summer_idx,:)]; % 1:4 - time, 5-monoterpenes,6-cs.
voc_cs_main=[datevec_voc(:,1:4),mono_median_h(:),median_cs(:),temp(:),o3(:)]; % 1:4 - time, 5-monoterpenes,6-cs, 7-o3.
traj_file=[datenum_sect(:,1:4),sect(:,3),sect(:,4)]; % 1:4 - time, 5-time over land, 6-area code.
t1=array2table(voc_cs_main(:,:));
t2=array2table(traj_file(:,:));
table_values=innerjoin(t2,t1,'Keys',1:4);
struct_table=table2array(table_values); %1;4 -time 5-time over land,6-codes,7-mono,8-cs 9-o3; 
convert_table =[struct_table;tab_14];

id_0 = find(convert_table(:,8)<=0.001);
convert_table(id_0,:)=[];

%%
% [overlap,ia,ib]=intersect(sect(:,1),datenum_voc(:,1));
%%

sector_names={'Multiple sectors';'Clean air';'Russia'; 'Europe'};
sector_markers={'*';'o';'s';'d'};
legend_names={'Multiple sectors';'Clean air';'Russia'; 'Europe'};
new_secc={'Multiple sectors';'Clean air';'Russia'; 'Europe'};
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
title('CS vs Monoterpene summer 2010-2014')
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
 print 2010_all_sectors_fig.png -dpng -r200;
 

 %% Scatter plots for each sector, colored by with inverse fit cs vs mono
 
 for nsec=2:length(sector_names)
     figure('Position',[1 1 1000 1000]);
     
    sec_idx=[];
    sec_idx=find(convert_table(:,6)==nsec-1 & convert_table(:,4)>=hours(1) & convert_table(:,4)<=hours(end) & convert_table(:,7)>0 & convert_table(:,8)>0);
     x=log10(convert_table(sec_idx,8));
     y=log10(convert_table(sec_idx,7));
          
     time=convert_table(sec_idx,1:4);     
   scatter(log10(convert_table(sec_idx,8)),log10(convert_table(sec_idx,7)),80,convert_table(sec_idx,5), sector_markers{nsec},'filled');
   hold on

      
        [pp,sp]=polyfit(x,y,1);
        vall = polyval(pp,x); 
        [p_rob,s_rob]=robustfit(x,y);
        fit=p_rob(2)*x + p_rob(1);
     %   fit_inv=(x-p_rob(1))./p_rob(2);
     %   poly_inv=(x-pp(2))./pp(1);
     [bb,sl_bi]=bivariate(x,y,0,2);
      equ_fit=bb*x+sl_bi;
      
      
     lh=plot(x, fit,'r' ,x, vall,'k-',x,equ_fit,'bo-','linewidth',2);

   legend(lh,'Robust','Polyfit','Bivariate fit') 
%       %hold on 
  xlim([-3 -1.6])
  ylim([-2 0.2])

bifit_slope_cs_mono(nsec)=bb;
rob_slope_cs_mono(nsec)=p_rob(2);
slope_m_cs_mono(nsec)=pp(1);
cross_corr_cs_mono=corrcoef(x,y);
coor_cs_mono(nsec)=cross_corr_cs_mono(1,2);
  
%  ylim([-3 -1.6])
%  xlim([-2 0.2])
% 
title([sector_names{nsec}, ', ',' CS vs Monoterpene summer 2010-2014 with inverse fit'])
ylabel('log(mono) [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('log(cs) [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')



grid on
colormap('jet');
cb = colorbar;
ylabel(cb,'Time over land','fontsize',16,'fontweight','b')
caxis([0 96])
ax_pos=get(gca,'position');
ax_pos(3)=ax_pos(3)*1.0;   
set(gca,'position',ax_pos);
 

 set(gcf,'PaperPositionMode','auto');
     
    plot_name=[sector_names{nsec},'.png'];
    print(plot_name,'-dpng','-r200');
    hold off
 end
 
 
 %% mono vs cs with inverse function
 for nsec=2:length(sector_names)
     figure('Position',[1 1 1000 1000]);
     
    sec_idx=[];
    sec_idx=find(convert_table(:,6)==nsec-1 & convert_table(:,4)>=hours(1) & convert_table(:,4)<=hours(end) & convert_table(:,7)>0 & convert_table(:,8)>0 & convert_table(:,5)>0 );
     x=log10(convert_table(sec_idx,7));
     y=log10(convert_table(sec_idx,8));
     z=convert_table(sec_idx,5);
          
     time=convert_table(sec_idx,1:4);     
   scatter(log10(convert_table(sec_idx,7)),log10(convert_table(sec_idx,8)),z,convert_table(sec_idx,10), sector_markers{nsec},'filled');
   hold on
%         set(gca,'xscale','log')
%         set(gca,'yscale','log')
    %    [P,s]= robustfit(x,y);
if nsec==2
    o3_ca=sec_idx;
elseif nsec==3
    o3_rus=sec_idx;
else
    o3_eur=sec_idx;
end
        [pp,sp]=polyfit(x,y,1);
        vall = polyval(pp,x); 
        [p_rob,s_rob]=robustfit(x,y);
        fit=p_rob(2)*x + p_rob(1);
        fit_inv=(x-p_rob(1))./p_rob(2);
        poly_inv=(x-pp(2))./pp(1);
        
        [bb_mono,sl_bi_mono]=bivariate(x,y,0,2);
         equ_fit_mono=bb_mono*x+sl_bi_mono;
      
     lh=plot(x, fit,'r' ,x, vall,'k', x,equ_fit_mono,'bo-','linewidth',2);
     % plot(y,fit_inv,'bo',y,poly_inv,'y','linewidth',2)

   legend(lh,'Robust','Polyfit','Bivariate fit') 
   
%       %hold on 
  xlim([-2 0.5])
  ylim([-3.5 -1])
 
bifit_slope_mono(nsec)=bb_mono;
rob_slope_mono_cs(nsec)=p_rob(2);
slope_mono_cs(nsec)=pp(1);
cross_corr_mono_cs=corrcoef(x,y);
coor_mono_cs(nsec)=cross_corr_mono_cs(1,2);
  
%  ylim([-3 -1.6])
%  xlim([-2 0.2])
% 
title([sector_names{nsec}, ', ',' Monoterpene vs CS summer 2010-2014 with inverse fit'])
ylabel('log(cs) [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('log(monoterpene) [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')

grid on
colormap('jet');
cb = colorbar;
ylabel(cb,'Ozone','fontsize',16,'fontweight','b')
caxis([10 55])
ax_pos=get(gca,'position');
ax_pos(3)=ax_pos(3)*1.0;   
set(gca,'position',ax_pos);
 

 set(gcf,'PaperPositionMode','auto');
     
    plot_name=[sector_names{nsec},'.png'];
    print(plot_name,'-dpng','-r200');
    hold off
 end
%  clear x; clear y;
 

%% subplot

     figure('Position',[1 1 2000 2000]);
     
     
     subplot(1,3,1)
    sec_idx=[];
    sec_idx=find(convert_table(:,6)==1 & convert_table(:,4)>=hours(1) & convert_table(:,4)<=hours(end) & convert_table(:,7)>0 & convert_table(:,8)>0 & convert_table(:,5)>0 );
     x=log10(convert_table(sec_idx,7));
     y=log10(convert_table(sec_idx,8));
     z=convert_table(sec_idx,5);
          
     time=convert_table(sec_idx,1:4);     
   scatter(log10(convert_table(sec_idx,7)),log10(convert_table(sec_idx,8)),z,convert_table(sec_idx,10), sector_markers{nsec},'filled');
   hold on
grid on
        [pp,sp]=polyfit(x,y,1);
        vall = polyval(pp,x); 
        [p_rob,s_rob]=robustfit(x,y);
        fit=p_rob(2)*x + p_rob(1);
        fit_inv=(x-p_rob(1))./p_rob(2);
        poly_inv=(x-pp(2))./pp(1);
        
        [bb_mono,sl_bi_mono]=bivariate(x,y,0,2);
         equ_fit_mono=bb_mono*x+sl_bi_mono;
      
     lh=plot(x, fit,'r' ,x, vall,'k', x,equ_fit_mono,'b','linewidth',2);
     % plot(y,fit_inv,'bo',y,poly_inv,'y','linewidth',2)

   legend(lh,'Robust','Polyfit','Bivariate fit') 
   title(' Clean Air')
   ylabel('log(cs) [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('log(monoterpene) [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
   
%       %hold on 
  xlim([-2 0.5])
  ylim([-3.5 -1])
 
  clear sec_idx; clear x; clear y; clear z;
  
       subplot(1,3,2)
    sec_idx=[];
    sec_idx=find(convert_table(:,6)==2 & convert_table(:,4)>=hours(1) & convert_table(:,4)<=hours(end) & convert_table(:,7)>0 & convert_table(:,8)>0 & convert_table(:,5)>0 );
     x=log10(convert_table(sec_idx,7));
     y=log10(convert_table(sec_idx,8));
     z=convert_table(sec_idx,5);
          
%      time=convert_table(sec_idx,1:4);     
   scatter(log10(convert_table(sec_idx,7)),log10(convert_table(sec_idx,8)),z,convert_table(sec_idx,10), sector_markers{nsec},'filled');
   hold on
grid on
        [pp,sp]=polyfit(x,y,1);
        vall = polyval(pp,x); 
        [p_rob,s_rob]=robustfit(x,y);
        fit=p_rob(2)*x + p_rob(1);
        fit_inv=(x-p_rob(1))./p_rob(2);
        poly_inv=(x-pp(2))./pp(1);
        
        [bb_mono,sl_bi_mono]=bivariate(x,y,0,2);
         equ_fit_mono=bb_mono*x+sl_bi_mono;
      
     lh=plot(x, fit,'r' ,x, vall,'k', x,equ_fit_mono,'b','linewidth',2);
     % plot(y,fit_inv,'bo',y,poly_inv,'y','linewidth',2)

     
   legend(lh,'Robust','Polyfit','Bivariate fit') 
    title(' Russia')
   ylabel('log(cs) [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('log(monoterpene) [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')

%       %hold on 
  xlim([-2 0.5])
  ylim([-3.5 -1])

 clear sec_idx; clear x; clear y; clear z;
       subplot(1,3,3)
    sec_idx=[];
     
    sec_idx=find(convert_table(:,6)==3 & convert_table(:,4)>=hours(1) & convert_table(:,4)<=hours(end) & convert_table(:,7)>0 & convert_table(:,8)>0 & convert_table(:,5)>0 );
     x=log10(convert_table(sec_idx,7));
     y=log10(convert_table(sec_idx,8));
     z=convert_table(sec_idx,5);
          
     time=convert_table(sec_idx,1:4);     
   scatter(log10(convert_table(sec_idx,7)),log10(convert_table(sec_idx,8)),z,convert_table(sec_idx,10), sector_markers{nsec},'filled');
   hold on

        [pp,sp]=polyfit(x,y,1);
        vall = polyval(pp,x); 
        [p_rob,s_rob]=robustfit(x,y);
        fit=p_rob(2)*x + p_rob(1);
        fit_inv=(x-p_rob(1))./p_rob(2);
        poly_inv=(x-pp(2))./pp(1);
        
        [bb_mono,sl_bi_mono]=bivariate(x,y,0,2);
         equ_fit_mono=bb_mono*x+sl_bi_mono;
      
     lh=plot(x, fit,'r' ,x, vall,'k', x,equ_fit_mono,'b','linewidth',2);
     % plot(y,fit_inv,'bo',y,poly_inv,'y','linewidth',2)
grid on
   legend(lh,'Robust','Polyfit','Bivariate fit') 
   
%       %hold on 
  xlim([-2 0.5])
  ylim([-3.5 -1])
  
title(' Europe')
 ylabel('log(cs) [s^-^1]','FontSize',16,'FontWeight','bold','Color','k')
xlabel('log(monoterpene) [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')

 set(gcf,'PaperPositionMode','auto');
     
%     plot_name=[sector_names{nsec},'.png'];
%     print(plot_name,'-dpng','-r200');
%     hold off

colormap('jet');
cb = colorbar;
ylabel(cb,'Ozone (ppb)','fontsize',16,'fontweight','b')
caxis([10 55])
ax_pos=get(gca,'position');
ax_pos(3)=ax_pos(3)*1.0;   
set(gca,'position',ax_pos);



 %% slopes
cs_mono_slopes=[slope_m_cs_mono;rob_slope_cs_mono;bifit_slope_cs_mono];
mono_cs_slopes=[slope_mono_cs;rob_slope_mono_cs; bifit_slope_mono];

ca_o3_conc=convert_table(o3_ca,10);
ru_o3_conc=convert_table(o3_rus,10);
eu_o3_conc=convert_table(o3_eur,10);


ca_mono_conc=convert_table(o3_ca,7);
ru_mono_conc=convert_table(o3_rus,7);
eu_mono_conc=convert_table(o3_eur,7);

ca_cs_conc=convert_table(o3_ca,8);
ru_cs_conc=convert_table(o3_rus,8);
eu_cs_conc=convert_table(o3_eur,8);

%% Bar plots

edges=[10:10:70];
edges_mono=[0:0.8:5];
edges_cs=[0:0.003:0.021];

[counts1,centers] = hist(ca_o3_conc,edges);
[counts2,centers] = hist(ru_o3_conc,edges);
[counts3,centers] = hist(eu_o3_conc,edges);


[counts1_mono,centers_mono] = hist(ca_mono_conc,edges_mono);
[counts2_mono,centers_mono] = hist(ru_mono_conc,edges_mono);
[counts3_mono,centers_mono] = hist(eu_mono_conc,edges_mono);


[counts1_cs,centers_cs] = hist(ca_cs_conc,edges_cs);
[counts2_cs,centers_cs] = hist(ru_cs_conc,edges_cs);
[counts3_cs,centers_cs] = hist(eu_cs_conc,edges_cs);

c = categorical({'Clean air','Russia','Europe'});

figure('Position',[1 1 2000 2000]);
subplot(1,3,1)
b=bar(c,[counts1; counts2; counts3],1.0);
title('O_3 concetrations')
ylabel('Counts','FontSize',16,'FontWeight','bold','Color','k')
xlabel('Concentrations [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
ylim([0 200])
lh=legend('10-20 ppb' ,'20-30 ppb','30-40 ppb','40-50 ppb' ,'50-60 ppb','60-70 ppb');
lh.FontSize=16;


%figure('Position',[1 1 1000 1000]);
subplot(1,3,2)
b=bar(c,[counts1_mono; counts2_mono; counts3_mono],1.0);

title('Monoterpene concentrations')
ylabel('Counts','FontSize',16,'FontWeight','bold','Color','k')
xlabel('Concentrations [ppb]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
ylim([0 200])
lh=legend('0-0.8 ppb' ,'0.8-1.6 ppb','1.6-2.4 ppb','2.4-3.2 ppb' ,'3.2-4.0 ppb','4.0-4.8 ppb');
lh.FontSize=16;

%figure('Position',[1 1 1000 1000]);
subplot(1,3,3)
b=bar(c,[counts1_cs; counts2_cs; counts3_cs],1.0);

title('CS')
ylabel('Counts','FontSize',16,'FontWeight','bold','Color','k')
xlabel('CS (s^-^1)]','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
ylim([0 200])
lh=legend('0-0.003 s^-^1' ,'0.003-0.006 s^-^1','0.009-0.012 s^-^1','0.012-0.015 s^-^1' ,'0.015-0.018 s^-^1', '0.018-0.021 s^-^1','0.021-0.024 s^-^1');
lh.FontSize=16;

