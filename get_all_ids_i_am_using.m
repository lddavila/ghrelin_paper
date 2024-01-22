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
all_experiment_names = {all_names_baseline};
all_experiment_dates = {all_dates_baseline};

all_experiments = {"Baseline"};


%% get ids of all Data I'm using
clc;
ids = get_ids_of_all_data(all_experiment_names,all_experiment_dates,all_experiments);       

%% check which ids are in feature table and get back the ones that aren't
ids_which_arent_in_feature_table = find_what_isnt_in_feature_table(ids);
disp(ids_which_arent_in_feature_table);

