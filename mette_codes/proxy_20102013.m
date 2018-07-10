close all;
clear all;
%% import data
%Imports data from 2010 to 2015. The resulting matrix can be saved as a .m
%file, which can be used later on.

proxy_file  = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\MT_proxy_1996_2015.dat']);

datevec_proxy=datevec([proxy_file(:,1)]);
idx_proxy=find(datevec_proxy(:,1)>=2010);
proxy_years20102015=proxy_file(idx_proxy,:);



