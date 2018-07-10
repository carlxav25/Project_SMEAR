clc
clear
close all
nbins=20;
series1 = [10,25,90,35,16, 8, 25, 55, 55];
series2 = [7,38,31,50,41,25,90,35,16];
[series1,centers] = hist(series1,nbins);
[series2] = hist(series2,centers);
DataSum=series1+series2;
figure
width1 = 0.5;
bar(centers,DataSum,width1,'FaceColor',[0.2,0.2,0.5],....
                     'EdgeColor','none');
hold on
width2 = width1;
bar(centers,series2,width2,'FaceColor',[0,0.7,0.7],...
                     'EdgeColor',[0,0.7,0.7]);
hold off
legend('First Series','Second Series') % add legend
