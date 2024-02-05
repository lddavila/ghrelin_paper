%% Get All The Names and Dates 
%baseline 
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data";
experiment = "Baseline_Just_Rotation_pts";
[all_names_baseline,all_dates_baseline] = get_list_of_names_and_dates(directory_to_check); %get names and dates for baseline data
disp([all_names_baseline,all_dates_baseline])

%% oxy
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy";
experiment = "Oxy_Just_Rotation_pts";
[all_names_oxy,all_dates_oxy] = get_list_of_names_and_dates(directory_to_check);

%% food deprivation
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation";
experiment = "food_deprivation_new_features";
[all_names_food_deprivation,all_dates_food_deprivation] = get_list_of_names_and_dates(directory_to_check);

%% boost and etho
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Boost and Etho";
experiment = "boost_and_etho";
[all_names_lg_boost_and_etho,all_dates_lg_boost_and_etho] = get_list_of_names_and_dates(directory_to_check);

%% Ghrelin
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Ghrelin";
experiment = "ghrelin";
[all_names_ghrelin,all_dates_ghrelin] = get_list_of_names_and_dates(directory_to_check);

%% saline
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Saline";
experiment = "saline";
[all_names_saline,all_dates_saline] = get_list_of_names_and_dates(directory_to_check);

%% concatenate everything
all_experiment_names = {all_names_baseline,all_names_oxy,all_names_food_deprivation,all_names_lg_boost_and_etho,all_names_ghrelin,all_names_saline};
all_experiment_dates = {all_dates_baseline,all_dates_oxy,all_dates_food_deprivation,all_dates_lg_boost_and_etho,all_dates_ghrelin,all_dates_saline};
all_experiments = {"Baseline","Oxy","Food_Deprivation","Boost_and_Etho","Ghrelin","Saline"};



%% Get Psychometric functions for all experiments
clc;
where_psych_func_table_will_be_rel = "Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Psych"; %folder where psychometric function tables will be saved
run_psychometric_functions(where_psych_func_table_will_be_rel,all_experiment_names,all_experiment_dates,all_experiments) %create the psychometric function tables

%% Run The Sigmoid Analysis
run_sigmoid_analysis_updated("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Psych","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Sigmoids");

%% Run Sigmoid Analysis of just Oxy Rotation Points Method 4
% run_sigmoid_analysis_updated("Oxy Rotation Points Method 4 Only", "Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Sigmoids")

%% Run Sigmoid Analysis of Just Stopping pts per unit traveled method 6
% run_sigmoid_analysis_updated("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Psych_Stopping_Points_Only","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Sigmoids");

%% Run Sigmoid Analysis of Just Saline Features
run_sigmoid_analysis_updated("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Psych_Saline_Only", "Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Sigmoids")

%% Get directories with sigmoid data
all_dirs = get_all_directories_with_sigmoid_data("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Sigmoids",[]);
disp(all_dirs)
% %% Get Only baseline data
% all_dirs = all_dirs(contains(all_dirs.Experiment,"Baseline"),:);

%% Plot Things Without normalizing 
create_individual_plots_without_normalizing(all_dirs,"Ind_Plots_Without_Normalizing","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables");

%% Get Individual Plots
%dont RUN THIS AGAIN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%create_individual_plots_2(all_dirs,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Individual_Plots","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables")

%% Get Individual plots for only non baseline stopping points 
%DONT RUN THIS SECTION AGAIN
% clc
% all_dirs = all_dirs(~contains(all_dirs.Experiment,"Baseline") & contains(all_dirs.Experiment,"stopping_points"),:);
% disp(all_dirs)
% create_individual_plots_2(all_dirs,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Individual_Plots","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables")

%% Get individual plots for only saline 
% DONT RUN THIS SECTION AGAIN
% clc
% all_dirs = all_dirs(contains(all_dirs.Experiment,"Saline"),:);
% create_individual_plots_2(all_dirs,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Individual_Plot","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables");
%% Calculate Probabilities of Each Cluster and create individual spider plots
[all_probabilities,list_of_clusters] = get_all_experiments_and_clusters("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Spider_Plots");
% disp([string(keys(all_probabilities).'),cell2mat(values(all_probabilities).')]);
% table_of_all_probabilities = table(string(keys(all_probabilities).'),cell2mat(values(all_probabilities).'),'VariableNames',["Experiment",list_of_clusters]);
table_of_all_probabilities = array2table(cell2mat(values(all_probabilities).'),"RowNames",string(keys(all_probabilities).'),"VariableNames",list_of_clusters);
% disp(table_of_all_probabilities)

%% put all spider plots into single pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Spider_Plots","Spider_plots.pdf","All_PDFS");

%% Create Overlay Spider Plots
create_overlay_spider_plots(table_of_all_probabilities, "Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Overlaid_Spider_Plots");

%% put all overlaid spider plots into single pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Overlaid_Spider_Plots","Overlain_Spider_plots.pdf","All_PDFS");

%% create migration plots
clc;
create_migration_plots_2("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Migration_Plots","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Spider_Plots_PDFS");

%% Put all migration plots into single pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Migration_Plots","Migration_Plots.pdf","All_PDFS")
%% measure skewness of datasets
clc
get_skewness_comparison("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables","Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Skewness_Plots")

%% put all skewness plots into single pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Skewness_Plots","Skewness Plots.pdf","All_PDFS");
%% get distributions of each individual rat's probabilities
clc;
close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];

get_all_euclidian_distance_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Euc_Distance_Plots",true);


%% put all euclidian Distance plots into single pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Euc_Distance_Plots","Euc_dist.pdf","All_PDFS");

%% get distributions of each individual rat's euclidian distance compared to other rats 
clc;close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];
get_individual_rats_euc_distance_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Euc_Distance_Plots_Individual");

%% get spider plots of each individual rat's probabilities compared to other rats
clc;close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
experiment_list = ["Oxy"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];
get_individual_rats_spider_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Spider_Plots_Individual");



%% put individual spider plots of each individual rat's probabilities compared to other rats into pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Spider_Plots_Individual","Individual Rats Spider Plots.pdf","All_PDFS");

%% get spider plots comparing baseline rats to all other experiment rats
clc;close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];
get_spider_plots_comparing_rats_between_experiments("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_SP_Baseline_To_other");

%% concatenate spider plots which compare baseline rats to all other experiment rats
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_SP_Baseline_To_other","Baseline Rats To Other Rats.pdf","All_PDFS");

%% get distributions of each individual rat's probabilities without normalizing for probability
clc;
close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];

get_all_euclidian_distance_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Euc_Distance_Plots_Not_Norm",false);


%% put all euclidian Distance plots into single pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Euc_Distance_Plots_Not_Norm","Euc_dist_not_norm.pdf","All_PDFS");

%% get probability table for every rat and every experiment
clc; close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];
get_every_probabilty_table_for_every_rat("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_AVG_SP_PLT")

%% get spider plots of each individual rat's probabilities compared to other rats only for oxy
clc;close all;
experiment_list = ["Oxy"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];
get_individual_rats_spider_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Spider_Plots_only_oxy");
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Spider_Plots_only_oxy","Oxy Animals Compared To Each Other.pdf","ALL_PDFs")

%% Get Spider Plots for each individual Rat for all features exclude SP Method 4
clc; close all;
experiment_list = ["Baseline"];
features_to_exclude = ["RP4_"];
get_individual_rats_spider_plots_for_every_feature("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,features_to_exclude,"Spider_Plots_All_Features",true);

%% concatenate the above into single pdf
concatenate_many_plots("Spider_Plots_All_Features","Spider_plots_aladdin_to_other_baseline_animals.pdf","ALL_PDFS")

%% Get Spider Plots for each individual Rat in Oxy for all features exclude SP Method 4
% clc; close all;
experiment_list = ["Oxy"];
features_to_exclude = ["RP4_"];
get_individual_rats_spider_plots_for_every_feature("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,features_to_exclude,"Spider_Plots_All_Features_Oxy",true);
%% concatenate the above into single pdf
concatenate_many_plots("C:\Users\ldd77\OneDrive\Desktop\ghrelin_paper\Spider_Plots_All_Features_Oxy","Spider_Plots_Oxy_animals_compared_to_eachother.pdf","ALL_PDFS")


%% get spider plots which are very similar, not very similar, and kind of similar for each rat in each experiment
clc; close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
features_to_exclude = ["RP4_"];
get_individual_rats_euclidian_distance_from_each_other("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,features_to_exclude,"Spider Plots For RECORD paper",true);

%% get Euclidian Distance Plots for all features comparing rats within the same experiment
clc;
close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
features_to_exclude = ["RP4_"];
get_ind_rats_euc_distance_dist_from_each_other_all_features("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,features_to_exclude,"Histogram for RECORD Paper",true);


%% Move Plot Pairs From Separate folders into same folder
%in this case I'm plotting spider plots to their histogram of euclidian distance pairs
clc;
first_path_of_files = "Spider Plots For RECORD paper";
second_path_of_files = "Histogram for RECORD Paper";
path_to_copy_files_to = "Similar Not Similar Somewhat Similar Spider Plots and Histograms for RECORD paper";
copy_plots_from_2_folders_to_single_folder(first_path_of_files,second_path_of_files,path_to_copy_files_to)

%% concatenate the above into single pdf
concatenate_many_plots("Similar Not Similar Somewhat Similar Spider Plots and Histograms for RECORD paper","Histograms_and_Spider_plots_together.pdf","ALL_PDFS")

%% Bin Cluster Tables by 28 days
clc;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
rebin_cluster_tables("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables","Rebinned Cluster Tables",experiment_list,28)


%% get euclidian distance plots for all features 
clc; close all;
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Food_Deprivation"];
features_to_exclude = ["RP4_"];
get_euc_distance_dist_for_every_feature("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,features_to_exclude,"Euc_Dist_All_Features",true);

%% concatenate the above
concatenate_many_plots("A Figures For RECORD paper","All Features Together Histograms.pdf","ALL_PDFS")

%% divide each individual rat's cluster data into 2 bins
clc;
% cd("C:\Users\ldd77\OneDrive\Desktop\ghrelin_paper")
% rmdir("Rebinned Cluster Tables Version 2",'s')
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
rebin_individual_rats_cluster_info("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables","Rebinned Cluster Tables Version 2",experiment_list,2)

%% get directories with rebinned data
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
rebinned_dirs = get_rebinned_directories("Rebinned Cluster Tables Version 2",experiment_list);

%% get euclidian distance between each rats first and last bin
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
get_euclidian_distances_between_rats_first_and_last_bin(rebinned_dirs,experiment_list,true,["RP4_"],"First_and_last_bin_euc_dist_hist");

%% concatenate the above into single file
concatenate_many_plots("First_and_last_bin_euc_dist_hist","all_first_and_last_bin_euc_dist_histograms.pdf","ALL_PDFS")

%% get directories with rebinned data
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
rebinned_dirs = get_rebinned_directories("Rebinned Cluster Tables",experiment_list);

%% get euclidian distance between each rats first and last bin
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
get_euclidian_distances_between_rats_first_and_last_bin_overlay(rebinned_dirs,experiment_list,true,["RP4_"],"First_and_last_bin_overlay_plots",2);

%% concatenate the above into single file
concatenate_many_plots("First_and_last_bin_overlay_plots","First_and_last_bin_overlay_plots.pdf","ALL_PDFS")

%% get examples of rats with a great change between first/last bin, no change between first/last bin, and med change between their first and last bin
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
get_euc_dist_between_rats_first_and_last_bin_for_sp_plts(rebinned_dirs,experiment_list,true,["RP4_"],"First_and_last_bin_Spider_plots",true);

%% something random
one = "C:\Users\ldd77\OneDrive\Desktop\Main Fig 6 Oxy";
two = "C:\Users\ldd77\OneDrive\Desktop\Supp Fig 5 Food Dep";
three = "C:\Users\ldd77\OneDrive\Desktop\Supp Fig 7 Alcohol"; 
concatenate_many_plots(one,"1.pdf","ALL_PDFS");
concatenate_many_plots(two,"2.pdf","ALL_PDFS");
concatenate_many_plots(three,"3.pdf","ALL_PDFS");