%% Function for plotting scatter plots
%[correlation_parameters]
function [correlation_parameters]=plot_scatter(data1_median,data1_column,data2_median,data2_column,index,data_cb,data_cb_column,figure_name,xlabel_name,ylabel_name,cm_look,colorbar_name)

figure; hold on;
scatter(log10(data1_median(index,data1_column)),log10(data2_median(index,data2_column)),50,data_cb(index,data_cb_column),'filled');
title(figure_name)
xlabel(xlabel_name,'FontSize',16,'FontWeight','bold','Color','k')
ylabel(ylabel_name,'FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')%,'Xscale','log','yscale','log')
colormap(cm_look)
cb = colorbar;
ylabel(cb,colorbar_name,'fontsize',16,'fontweight','b')

[r,p]=corr(log10(data1_median(index,data1_column)),log10(data2_median(index,data2_column)),'rows','complete') %r is the linear correlation coefficient, p is the p-value 

correlation_parameters = [r;p] % Returns to main program
end

