
close all
clear all
clc

rh_data      = load(['/home/local/carltonx/Documents/Smear_course//New_data/20160501-20173113_rh.txt']);
temp_data    = load(['/home/local/carltonx/Documents/Smear_course/New_data/20160501-20173113_temp.txt']);
dmps_data    = load(['/home/local/carltonx/Documents/Smear_course/New_data/2016/dm160415.sum']);


rh_datenum   = datenum(rh_data(:,1:6));
temp_datenum = datenum(temp_data(:,1:6));
% dmps_datenum = datenum(dmps_data(:,1:6));


rh = [rh_datenum,rh_data(:,7)];
t  = [temp_datenum,temp_data(:,7)];
% v = [dmps_datenum,dmps_data(:,7)];

CS = CS_calc_day(dmps_data,rh,t,3)