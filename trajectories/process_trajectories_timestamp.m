path_to_traj='/home/local/carltonx/Documents/Smear_course/trajectories/data/';
% path_to_traj='/put/your/path/here/'; %define path to data
files_traj_all=dir(path_to_traj);%ls(path_to_traj,'*'); %get_list(path_to_traj,'*.traj'); % get list of files in folder with trajectories
name= extractfield(files_traj_all, 'name')';
skip_str=7; % because hysplit is 7 letters

datenum_traj_all=nan(length(files_traj_all),1);
%hours=[2:3:23]';
hours=[8:3:17];
month=7; % me
dates=[3;14;18]; %me
count=0;
for nf=3:length(files_traj_all)
    curr_file=name{nf};  %files_traj_all{nf};
    yy=str2double(curr_file(skip_str+1:skip_str+4));
    mm=str2double(curr_file(skip_str+5:skip_str+6));
    dd=str2double(curr_file(skip_str+7:skip_str+8));
    hh=str2double(curr_file(skip_str+9:skip_str+10));
    datenum_traj_all(nf,1)=datenum(yy,mm,dd,hh,0,0);
   for fn = 1:length(dates) 
     if find( month==mm & hours==hh & dates(fn)==dd)
             count=count+1;
        files_traj{count,1}=curr_file;
     end
   end
end
%%%%%% Now you names of files with trajectories you need to open, every
%%%%%% three hours (2,5,8 etc)
