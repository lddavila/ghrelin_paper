%% starts with running the following function
get_ghrelin_and_saline_toy_psychometric_functions('Psychometric Functions Fixed X Coordinates',[])

%% next step is to call run_sigmoid_analysis as follows
run_sigmoid_analysis('Psychometric Functions Fixed X Coordinates','All Experiments Fixed X Coordinates')

%% next get the directories
all_dirs = get_all_directories_with_sigmoid_data('All Experiments Fixed X Coordinates','rc');

%% create individual cluster plots
create_individual_plots(all_dirs,"Reward Choice","Plots Fixed X Coordinates", "Cluster Tables Fixed X Coordinates")

%% create overlay plots
create_overlay_plots(all_dirs,"Reward Choice", "Overlay Plots Fixed X Coordinates","PDFs Fixed X Coordinates")

%% get_radar_plots
get_all_experiments_and_clusters('Cluster Tables Fixed X Coordinates', "Spider Plots Fixed X Coordinates")
