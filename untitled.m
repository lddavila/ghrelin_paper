experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
rebinned_dirs = get_rebinned_directories("Rebinned Cluster Tables Version 2",experiment_list);

%% get euclidian distance between each rats first and last bin
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
get_euclidian_distances_between_rats_first_and_last_bin_overlay(rebinned_dirs,experiment_list,true,["RP4_"],"First_and_last_bin_overlay_plots_ext",2);

%% concatenate the above into single file
concatenate_many_plots("First_and_last_bin_overlay_plots_ext","First_and_last_bin_overlay_plots_ext.pdf","ALL_PDFS")

%% get examples of rats with a great change between first/last bin, no change between first/last bin, and med change between their first and last bin
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
get_euc_dist_between_rats_first_and_last_bin_for_sp_plts(rebinned_dirs,experiment_list,true,["RP4_"],"First_and_last_bin_Spider_plots_ext",true);