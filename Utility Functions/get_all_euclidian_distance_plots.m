function get_all_euclidian_distance_plots(path_of_cluster_tables,experiment_list,feature_list,fig_file_path)

if ~exist(fig_file_path,"dir")
    mkdir(fig_file_path)
end
home_dir = cd(fig_file_path);
fig_file_path_abs = cd(home_dir);

for feature=1:length(feature_list)
    current_feature = feature_list(feature);
    for experiment1=1:length(experiment_list)
        current_experiment_1 = experiment_list(experiment1);
        for experiment2=experiment1+1:length(experiment_list)
            figure;
            current_experiment_2 = experiment_list(experiment2);
            if strcmpi(current_experiment_1,"Baseline")
                experiment_1_euc_distances = findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep(path_of_cluster_tables,current_experiment_1,true,true,current_feature);
            else
                experiment_1_euc_distances =findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep(path_of_cluster_tables,current_experiment_1,false,true,current_feature);
            end
            if strcmpi(current_experiment_2,"Baseline")
                experiment_2_euc_distances = findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep(path_of_cluster_tables,current_experiment_2,true,true,current_feature);
            else
                experiment_2_euc_distances =findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep(path_of_cluster_tables,current_experiment_2,false,true,current_feature);
            end
            display(experiment_1_euc_distances.')
            display(experiment_2_euc_distances.')
            [h,p] = kstest2(experiment_1_euc_distances,experiment_2_euc_distances);
            title(strcat(current_feature," ",current_experiment_1, " Vs ",current_experiment_2))
            subtitle(strcat("From KS2 Test We Have h:",string(h), "And p:",string(p)))
            legend(current_experiment_1,current_experiment_2)
            saveas(gcf,strcat(fig_file_path_abs,"\",current_feature," ",current_experiment_1, " Vs ",current_experiment_2));
            hold off; 
            close(gcf)
        end
    end
end

end