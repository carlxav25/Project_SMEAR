close all
clear all

%%% load data
dmps_16      = importdata('dmps_16.sum');
dmps_17      = importdata('dmps_17.sum');
rh_data      = load(['/home/local/carltonx/Documents/Smear_course//New_data/20160501-20173113_rh.txt']);
temp_data    = load(['/home/local/carltonx/Documents/Smear_course/New_data/20160501-20173113_temp.txt']);

% index for colums starting with 0
ind_0_16 = find(dmps_16(:,1) == 0);
ind_0_17 = find(dmps_17(:,1) == 0);

% removing colums starting with 0
dmps_16([ind_0_16],:) = []; 
dmps_17([ind_0_17],:) = []; 

% converting  time to y m d h m s
 time_16 = datevec(datestr(dmps_16(:,1)));
 time_17 = datevec(datestr(dmps_17(:,1)));

 time_16(:,1)=2016;
 time_17(:,1)=2017;

% combining the files
 d_16 = [datenum(time_16(:,:)),dmps_16(:,2:end)];
 d_17 = [datenum(time_17(:,:)),dmps_17(:,2:end)];

 d_net = [d_16;d_17];
 datenum_net = datenum(d_net(:,1:6));


rh_datenum   = datenum(rh_data(:,1:6));
temp_datenum = datenum(temp_data(:,1:6));


rh = [rh_datenum,rh_data(:,7)];
t  = [temp_datenum,temp_data(:,7)];
% v = [dmps_datenum,dmps_data(:,7)];


%Finding the index
[datevec_rh,~,ind_rh]= unique(rh_data(:,1:4),'rows'); % find data for every hour
[datevec_temp,~,ind_t]= unique(temp_data(:,1:4),'rows'); % find data for every hour

%Mean value of rh based on hours
rh_median_h = grpstats(rh_data(:,7),ind_rh,'nanmedian'); % make medians
t_median_h = grpstats(temp_data(:,7),ind_t,'nanmedian'); % make medians

min60=datenum(0,0,0,1,0,0);
median_dmps=nan(length(t_median_h),1);

for nvoc=1:length(t_median_h)
    h_idx=find(d_net(:,1)>=rh_datenum(nvoc,1) & d_net(:,1)<rh_datenum(nvoc,1)+min60);
    if ~isempty(h_idx)
        median_dmps(nvoc,1)=nanmedian(d_net(h_idx,:));
    end
end
