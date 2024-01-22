%% Get All The Names and Dates 
%baseline 
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data";
experiment = "Baseline_Just_Rotation_pts";
[all_names_baseline,all_dates_baseline] = get_list_of_names_and_dates(directory_to_check); %get names and dates for baseline data
disp([all_names_baseline,all_dates_baseline])

%oxy
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy";
experiment = "Oxy_Just_Rotation_pts";
[all_names_oxy,all_dates_oxy] = get_list_of_names_and_dates(directory_to_check);

%food deprivation
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation";
experiment = "food_deprivation_new_features";
[all_names_food_deprivation,all_dates_food_deprivation] = get_list_of_names_and_dates(directory_to_check);

%boost and etho
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Boost and Etho";
experiment = "boost_and_etho";
[all_names_lg_boost_and_etho,all_dates_lg_boost_and_etho] = get_list_of_names_and_dates(directory_to_check);

%Ghrelin
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Ghrelin";
experiment = "ghrelin";
[all_names_ghrelin,all_dates_ghrelin] = get_list_of_names_and_dates(directory_to_check);

%saline
directory_to_check = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Saline";
experiment = "saline";
[all_names_saline,all_dates_saline] = get_list_of_names_and_dates(directory_to_check);


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
experiment_list = ["Baseline", "Oxy","Boost_And_Etho","Ghrelin","Saline","Food_Deprivation"];
feature_list = ["DT_","ET_","M_","RP1_","RP4_","SP_"];

get_all_euclidian_distance_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables",experiment_list,feature_list,"Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Euc_Distance_Plots");


%% put all euclidian Distance plots into single pdf
concatenate_many_plots("Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Euc_Distance_Plots","Euc_dist.pdf","All_PDFS")