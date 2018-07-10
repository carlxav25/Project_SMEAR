close all
clear all

section_analysis=load('sector_analysis.mat'); %% reading .mat file
sect= struct2array(section_analysis); % converting from struct to array
time= sect(:,1);
hours= sect(:,2); % time inside sector
over_land= sect(:,3); % time over land
code= sect(:,4); % sector code 0:intersectional, 1:clean, 2_Russia ,3: Europe  

datenum_sect=datevec(time);

%% codes and time over land for 3rd july
hours=[8:3:17]';
date = [3;14;18]';
code_sec=nan(length(hours),length(date));
land_sec=nan(length(hours),length(date));


for nnd = 1:length(date)
  for nnn = 1:length(hours)
    ind_x=find(datenum_sect(:,2)==7 & datenum_sect(:,3)==date(nnd) & datenum_sect(:,4)==hours(nnn));
      if ~isempty(ind_x)
        code_sec(nnn,nnd)=sect(ind_x,4);
        land_sec(nnn,nnd)=sect(ind_x,3);
      end
  end
end


  clear ind_x

%% codes and time over land for summer
hours=[8:3:17]';


for nf_s=1:length(hours)
  ind_x=find(datenum_sect(:,4)==hours(nf_s));
    if nf_s ==1
      code_8=sect(ind_x,4); % codes for hour 8
      land_8=sect(ind_x,3); % time over land for hour 8
      clear ind_x
    elseif nf_s ==2
      code_11=sect(ind_x,4); % codes for hour 11
      land_11=sect(ind_x,3); % time over land for hour 11
      clear ind_x
    elseif nf_s ==3
      code_14=sect(ind_x,4); % codes for hour 14
      land_14=sect(ind_x,3);% time over land for hour 14
      clear ind_x
    else nf_s == 4
      code_17=sect(ind_x,4); % codes for hour 17
      land_17=sect(ind_x,3);% time over land for hour 17
      clear ind_x
  end
end

codes=[code_8,code_11,code_14,code_17];
land=[land_8,land_11,land_14,land_17];

% fid1 = fopen('/home/local/carltonx/Documents/Smear_course/analysis/output_code_spec_days.dat','w');
% fid2 = fopen('/home/local/carltonx/Documents/Smear_course/analysis/output_land_spec_days.dat','w');
% 
% 
% for i = 1:length(hours)
%     for j = 1:length(date)
%     fprintf (fid1, '%22.3f',  code_sec(i,j));
%     fprintf (fid2, '%22.3f',  land_sec(i,j));
%     end
%     fprintf (fid1, '\n'); 
%     fprintf (fid2, '\n');
% end





