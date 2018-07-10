Hyy_coor = [61.85, 24.29]; % Hyytiälä coordinates
figure;
figsize=[1 1 1000 1000]; % set up size of figure, in pixels here
set(gcf,'Position',figsize) 

mh = worldmap('europe'); % plot worldmap
setm(mh,'MLabelLocation',10); %set location of longitude labels
map_box=[-45 45;45 90]; % set part of world to be plotted
% next three lines will define origin of projection based on the map box
origin(1)=0;
origin(2)=(abs(map_box(1,2))+abs(map_box(1,1)))/2+map_box(1,1);
origin(3)=0;
% define some mapping properties
setm(mh,'maplonlimit',map_box(1,:),'maplatlimit',map_box(2,:),'origin',origin)
% geoshow('landareas.shp', 'FaceColor', [0.5 1.0 0.5],'DisplayType','polygon');
geoshow('landareas.shp', 'FaceColor', rgb('GreenYellow'),'DisplayType','polygon');
% Plot station location
plotm(Hyy_coor,'pk','markerfacecolor','k')
% plot trajectory
ha=plotm(trajectory(:,4),trajectory(:,5),'Color','b','linewidth',2);
% plot markers every 6 hours
for npoints=2:13
    ppoint=(npoints-1)*6+1;
    plotm(trajectory(ppoint,4),trajectory(ppoint,5),'s','markeredgecolor','b','markerfacecolor','b');
end
mh.Position(3)=0.9; % this makes axes bit bigger
set(gcf,'PaperPositionMode','auto'); % make sure that saved figure is exactly like it's on display