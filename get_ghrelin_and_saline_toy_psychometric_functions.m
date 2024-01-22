function [] = get_ghrelin_and_saline_toy_psychometric_functions(directoryToSaveThingsTo,which_experiments_to_combine)

addpath('Utility Functions\')
clc
if ~exist(directoryToSaveThingsTo,"dir")
    mkdir(directoryToSaveThingsTo)
end
homeDir = cd(directoryToSaveThingsTo);
directoryToSaveThingsTo = cd(homeDir);
%% Get Session Counts For Ghrelin Toy Sessions
table_of_rat_and_date_info = readtable('Ghrelin_info.xlsx','Sheet','Automatic Ghr ToyRAT Session #s');

%disp(table_of_rat_and_date_info)
session_number = string(table_of_rat_and_date_info.Var2);
ghrelin_rat_names = string(table_of_rat_and_date_info.Var3);
ghrelin_rat_session_dates = table_of_rat_and_date_info.Var4;
toy = string(table_of_rat_and_date_info.Var5);


table_of_rat_and_date_info = table(session_number,ghrelin_rat_names,ghrelin_rat_session_dates,toy,'VariableNames',{'Session','Name','Date','Toy'});
% disp(table_of_rat_and_date_info)
table_of_rat_and_date_info = convertvars(table_of_rat_and_date_info,@isdatetime,@(t) datetime(t,'Format','MM/dd/yyyy'));
% disp(table_of_rat_and_date_info)
disp(height(table_of_rat_and_date_info))

% table_of_rat_and_date_info = rmmissing(table_of_rat_and_date_info);
ghrelin_toy_data = table_of_rat_and_date_info;
%% Get Session Counts For Saline Toy Sessions
% disp("///////////////////////////////////")
table_of_rat_and_date_info = readtable('Ghrelin_info.xlsx','Sheet','Automatic Ghr ToyRAT Session #s');

% disp(table_of_rat_and_date_info)
session_number = string(table_of_rat_and_date_info.Var10);
saline_rat_names = string(table_of_rat_and_date_info.Var11);
saline_rat_session_dates = table_of_rat_and_date_info.Var12;
toy = string(table_of_rat_and_date_info.Var13);
table_of_rat_and_date_info = table(session_number,saline_rat_names,saline_rat_session_dates,toy,'VariableNames',{'Session','Name','Date','Toy'});
% % disp(table_of_rat_and_date_info)
table_of_rat_and_date_info = convertvars(table_of_rat_and_date_info,@isdatetime,@(t) datetime(t,'Format','MM/dd/yyyy'));
% % disp(table_of_rat_and_date_info)
%
disp(height(table_of_rat_and_date_info))
% table_of_rat_and_date_info = rmmissing(table_of_rat_and_date_info);

% disp(table_of_rat_and_date_info)

saline_toy_data = table_of_rat_and_date_info;

%% find the matching rat toy session data
%disp(ghrelin_toy_data)
%disp(saline_toy_data)
clc
disp(size(saline_toy_data.Session))
disp(size(ghrelin_toy_data.Session))
rat_toy_saline_data = saline_toy_data(strcmpi(saline_toy_data.Session,ghrelin_toy_data.Session) & ...
    strcmpi(saline_toy_data.Name,ghrelin_toy_data.Name) & ...
    strcmpi(saline_toy_data.Toy,ghrelin_toy_data.Toy) & ...
    strcmpi(saline_toy_data.Toy,"Rat"),:);
% disp(rat_toy_saline_data)
disp(strcat("Saline Rat Toy: ",string(height(rat_toy_saline_data))))
rat_toy_ghrelin_data = ghrelin_toy_data(strcmpi(saline_toy_data.Session,ghrelin_toy_data.Session) & ...
    strcmpi(saline_toy_data.Name,ghrelin_toy_data.Name) & ...
    strcmpi(saline_toy_data.Toy,ghrelin_toy_data.Toy) & ...
    strcmpi(ghrelin_toy_data.Toy,"Rat"),:);
% disp(rat_toy_ghrelin_data)
disp(strcat("Ghrelin Rat Toy: ",string(height(rat_toy_ghrelin_data))))

%% find the matching stick toy sessions
%disp(ghrelin_toy_data)
%disp(saline_toy_data)
% clc
stick_toy_saline_data = saline_toy_data(strcmpi(saline_toy_data.Session,ghrelin_toy_data.Session) & ...
    strcmpi(saline_toy_data.Name,ghrelin_toy_data.Name) & ...
    strcmpi(saline_toy_data.Toy,ghrelin_toy_data.Toy) & ...
    strcmpi(saline_toy_data.Toy,"stick"),:);
% disp(rat_toy_saline_data)
disp(strcat("Saline Stick Toy: ",string(height(stick_toy_saline_data))))


stick_toy_ghrelin_data = ghrelin_toy_data(strcmpi(saline_toy_data.Session,ghrelin_toy_data.Session) & ...
    strcmpi(saline_toy_data.Name,ghrelin_toy_data.Name) & ...
    strcmpi(saline_toy_data.Toy,ghrelin_toy_data.Toy) & ...
    strcmpi(ghrelin_toy_data.Toy,"stick"),:);
% disp(rat_toy_ghrelin_data)
disp(strcat("Ghrelin Stick Toy: ",string(height(stick_toy_ghrelin_data))))

%% find the matching skewer toy session data
%disp(ghrelin_toy_data)
%disp(saline_toy_data)
% clc
skewer_toy_saline_data = saline_toy_data(strcmpi(saline_toy_data.Session,ghrelin_toy_data.Session) & ...
    strcmpi(saline_toy_data.Name,ghrelin_toy_data.Name) & ...
    strcmpi(saline_toy_data.Toy,ghrelin_toy_data.Toy) & ...
    strcmpi(saline_toy_data.Toy,"skewer"),:);
% disp(rat_toy_saline_data)
disp(strcat("Saline Skewer Toy: ",string(height(skewer_toy_saline_data))))


skewer_toy_ghrelin_data = ghrelin_toy_data(strcmpi(saline_toy_data.Session,ghrelin_toy_data.Session) & ...
    strcmpi(saline_toy_data.Name,ghrelin_toy_data.Name) & ...
    strcmpi(saline_toy_data.Toy,ghrelin_toy_data.Toy) & ...
    strcmpi(ghrelin_toy_data.Toy,"skewer"),:);
% disp(rat_toy_ghrelin_data)
disp(strcat("Ghrelin Skewer Toy: ",string(height(skewer_toy_ghrelin_data))))


%% Construct the ghrelin psychometric functions for each of the tables found above
ghrelin_combination_table = table([],[],[],[],'VariableNames',{'Session','Name','Date','Toy'});
ghrelin_combination_labels = '';
saline_combination_table = table([],[],[],[],'VariableNames',{'Session','Name','Date','Toy'});
saline_combination_labels = ''; 
is_in_combination = [false false false];
if length(which_experiments_to_combine) > 1
    for i=1:length(which_experiments_to_combine)
        switch which_experiments_to_combine(i)
            case 'rat_toy'
                ghrelin_combination_table = [ghrelin_combination_table;rat_toy_ghrelin_data];
                saline_combination_table = [saline_combination_table;rat_toy_saline_data];
                ghrelin_combination_labels=strcat(ghrelin_combination_labels,"_ghrelin_rat_toy_");
                saline_combination_labels=strcat(saline_combination_labels,"_saline_rat_toy_");
                is_in_combination(i) = true;
%                 break;
            case 'stick_toy'
                ghrelin_combination_table = [ghrelin_combination_table;stick_toy_ghrelin_data];
                saline_combination_table = [saline_combination_table;stick_toy_saline_data];
                is_in_combination(i) = true;
                ghrelin_combination_labels=strcat(ghrelin_combination_labels,"_ghrelin_stick_toy_");
                saline_combination_labels=strcat(saline_combination_labels,"_saline_stick_toy_");
%                 break;
            case 'skewer_toy'
                ghrelin_combination_table = [ghrelin_combination_table;skewer_toy_ghrelin_data];
                saline_combination_table = [saline_combination_table;skewer_toy_saline_data];
                is_in_combination(i) = true;
                ghrelin_combination_labels=strcat(ghrelin_combination_labels,"_ghrelin_skewer_toy_");
                saline_combination_labels=strcat(saline_combination_labels,"_saline_skewer_toy_");
%                 break;
        end
    end
    all_ghrelin_toy_tables = {rat_toy_ghrelin_data,stick_toy_ghrelin_data,skewer_toy_ghrelin_data};
    all_saline_toy_tables = {rat_toy_saline_data,stick_toy_saline_data,skewer_toy_saline_data};
    ghrelin_data_labels = ["Ghrelin_Rat_Toy", "Ghrelin_Stick_Toy", "Ghrelin_Skewer_Toy"];
    saline_data_labels = ["Saline_Rat_Toy", "Saline_Stick_Toy", "Saline_Skewer_Toy"]; 

    for i=1:length(is_in_combination)
        if boolean(is_in_combination(i))
            all_ghrelin_toy_tables{i} = [];
            all_saline_toy_tables{i} = []; 
            saline_data_labels(i) = '';
            ghrelin_data_labels(i) = '';
        end
    end
    all_ghrelin_toy_tables{end+1} = ghrelin_combination_table;
    all_saline_toy_tables{end+1} = saline_combination_table;
    saline_data_labels = [saline_data_labels, saline_combination_labels];
    ghrelin_data_labels = [ghrelin_data_labels, ghrelin_combination_labels];

    run_through_all_tables(all_ghrelin_toy_tables,directoryToSaveThingsTo,ghrelin_data_labels,"created by get_ghrelin_and_saline_toy_psychometric_functions.m","rc")
    run_through_all_tables(all_saline_toy_tables,directoryToSaveThingsTo,saline_data_labels,"created by get_ghrelin_and_saline_toy_psychometric_functions.m","rc")




else %if the length is zero that means don't combine any experiments
    all_ghrelin_toy_tables = {rat_toy_ghrelin_data,stick_toy_ghrelin_data,skewer_toy_ghrelin_data};
    all_saline_toy_tables = {rat_toy_saline_data,stick_toy_saline_data,skewer_toy_saline_data};
    run_through_all_tables(all_ghrelin_toy_tables,directoryToSaveThingsTo,["Ghrelin_Rat_Toy", "Ghrelin_Stick_Toy", "Ghrelin_Skewer_Toy"],"created by get_ghrelin_and_saline_toy_psychometric_functions.m","rc")
    run_through_all_tables(all_saline_toy_tables,directoryToSaveThingsTo,["Saline_Rat_Toy", "Saline_Stick_Toy", "Saline_Skewer_Toy"],"created by get_ghrelin_and_saline_toy_psychometric_functions.m","rc")
end





end


