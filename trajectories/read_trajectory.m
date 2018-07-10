 %traj_files=nan(length(files_traj),1);

%for ii = 1:length(files_traj)
traj_file='/home/local/carltonx/Documents/Smear_course/trajectories/data/hysplit2014071212.traj'; % trajectory file; you can put this whole routine in the loop
%file=files_traj(ii);
%traj_file='/home/local/carltonx/Documents/Smear_course/trajectories/data/' file;
% this block is to scan through file and find where actual data starts
fid = fopen(traj_file, 'r'); % get a file id
C = textscan(fid, '%s', 'Delimiter', '\n'); % scan file 
fclose(fid); % close id
C = strfind(C{1}, 'SUN_FLUX'); % search for "SUN_FLUX" string - this is
% because after this string actual data starts. I learned this from
% inspection of files

skip_lines = find(~cellfun('isempty', C)); % amount of lines that have to be skipped
clear C;
traj_data = importdata(traj_file, ' ', skip_lines); % import trajectory data


row=4; %Hyytiälä location, 100m arrival - 

[idx,jdx] = find(traj_data.data(:,1) == row); % find lines in file corresponding to Hyytiälä and 100m arrival height

trajectory=traj_data.data(idx,:); % make a trajectory variable containing desirable data

% line below created matlab format timestamp and adds it to the trajectory
% variable
time_stamp(:,1) = datenum([trajectory(:,3)+2000, trajectory(:,4), trajectory(:,5), trajectory(:,6), zeros(length(trajectory),1), zeros(length(trajectory),1)]);
%%
trajectory(:,1:6) = [];
trajectory(:,1) = time_stamp;

%end
% Most important columns are
% 4 - Latitude
% 5 - Longitude
% 6 - Altitude