clear all;
close all;

% Import the data file 
    data_VOC_2016=importdata('Mastdata_VOC_2016.txt');
    data_VOC_2017=importdata('Mastdata_VOC_2017.txt');
   % CS=load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\Hyde_Condensation_sink_1996_2016.dat']);
% Extracting data:
% Date and time:
    date_16=datenum(data_VOC_2016(:,1:4));
    date_17=datenum(data_VOC_2017(:,1:4));
% We find all the indexes at 4.2 meters:
    height16_42=find(data_VOC_2016(:,20)==42);
    height17_42=find(data_VOC_2017(:,20)==42);
% The concentration for monoterpenes  is defined:
    mtc_16=data_VOC_2016(height16_42,34);
    mtc_17=data_VOC_2017(height17_42,34);    
% The corresponding dates
    date16_42=date_16(height16_42,1);
    date17_42=date_17(height17_42,1);
% Concentration and dates:    
    monoterpene_data16=[date16_42,mtc_16];
    monoterpene_data17=[date17_42,mtc_17];
    
  hour_avg(monoterpene_data16)  
    
    
function hour_avg(data)
    [~,~,in]=unique(data(:,1),'rows');
    T_h=grpstats(data(:,end),in,'nanmean');
    figure;
    hold on;
    plot(T_h)
 
end
    
    
    
    
%
% Removes NaN:
%    monoterpene_data16(isnan(monoterpene_data16))=0;
%

    
%CS_datevec=datevec(CS(:,1));    
%idx_CS_16=find(CS_datevec(:,1)==2016 & CS_datevec(:,2)<=4);
 %CS_16=CS(idx_CS_16,:); 
   
 
 %figure
  %  hold on
   % plot(date16_42(1:200),mtc(1:200))


