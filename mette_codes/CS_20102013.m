clear all;
close all;

CS_file  = load(['C:\Users\mette\Documents\MATLAB\Hyytiälä\Hyde_Condensation_sink_1996_2016.dat']);

datevec_CS=datevec([CS_file(:,1)]);
idx_CS=find(datevec_CS(:,1)>=2010 & datevec_CS(:,1)<2016);
CS_years20102015=CS_file(idx_CS,:);
