function [] = run_sigmoid_analysis(file_path_with_psychometric_function_tables_relative,folder_where_all_experiment_data_will_be_saved_relative)
addpath('Utility Functions\')
homeDir = cd(file_path_with_psychometric_function_tables_relative);
file_path_with_psychometric_function_tables_absolute = cd(homeDir);
if ~exist(folder_where_all_experiment_data_will_be_saved_relative,"dir")
    mkdir(folder_where_all_experiment_data_will_be_saved_relative)
end
cd(folder_where_all_experiment_data_will_be_saved_relative);
folder_where_all_experiment_data_will_be_saved_absolute = cd(homeDir);
all_psychometric_function_files = ls(strcat(file_path_with_psychometric_function_tables_absolute,"/*.xlsx"));
all_psychometric_function_files = string(all_psychometric_function_files);

cd(folder_where_all_experiment_data_will_be_saved_absolute);

for i=1:height(all_psychometric_function_files)
    %disp(all_psychometric_function_files(i,:))
    all_info = split(all_psychometric_function_files(i,:));
    experiment = all_info(1);
    feature = all_info(2);
    current_psychometric_functions = readtable(strcat(file_path_with_psychometric_function_tables_absolute,"\",all_psychometric_function_files(i,:)));
    disp(current_psychometric_functions);
    %disp(experiment)
    mkdir(experiment)
    all_experiments_dir = cd(experiment);
    sigmoid_analysis(current_psychometric_functions,feature);
    cd(all_experiments_dir)

end
cd(homeDir)
end