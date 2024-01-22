function create_overlaid_spider_plots(spider_plot_dir,clusters_list,probabilities,experiment,calledBy)
% figure; hold on;
% disp(size(clusters_list))
% disp(size(probabilities))
axes_limits = [zeros(length(clusters_list),1).';(zeros(length(clusters_list),1)+1).'];
% disp(axes_limits);
% disp({clusters_list})
% disp(size({clusters_list}))
% disp(probabilities)
formatted_cluster_list = {};
for i=1:length(clusters_list)
    formatted_cluster_list{end+1} = char(clusters_list(i));
end
spider_plot(probabilities,'AxesLimits',axes_limits,'AxesLabels',formatted_cluster_list);
title(strrep(experiment,"_","\_"));
subtitle(strcat("Created by create_overlaid_spider_plots. Called by ", strrep(calledBy,"_","\_")));
formatted_legend_list = {};
for i=1:length(experiment)
    formatted_legend_list{end+1} = char(experiment(i));
end
legend(formatted_legend_list,'Location','southoutside')
disp(strcat(spider_plot_dir,"\",experiment(1), " vs ", experiment(2)," Spider Plot.fig"))
saveas(gcf,strcat(spider_plot_dir,"\",strrep(experiment(1),"_",""), " vs ", strrep(experiment(2),"_","")," Spider Plot.fig"),"fig");
close(gcf);
end