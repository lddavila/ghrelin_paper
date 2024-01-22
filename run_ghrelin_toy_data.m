%% Create Database connection
conn = database('live_database','postgres','1234');


%% Get Ghrelin toy data from file 'Ghrelin_info.xlsx','Sheet','Automatic Ghr ToyRAT Session #s'

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
table_of_rat_and_date_info = rmmissing(table_of_rat_and_date_info);
ghrelin_toy_data = table_of_rat_and_date_info;

%% Create Psychometric Function 
table_of_psychometric_functions = table([],[],[],[],[],[],[],[],[],'VariableNames',{'label','x1','x2','x3','x4','y1','y2','y3','y4'});
clc
unique_ghrelin_rats_rat_toy = unique(rat_toy_ghrelin_data.Name);

%remove the bad data
unique_ghrelin_rats_rat_toy = strrep(unique_ghrelin_rats_rat_toy,"Freya","");
unique_ghrelin_rats_rat_toy = strrep(unique_ghrelin_rats_rat_toy,"Bastet","");
unique_ghrelin_rats_rat_toy = strrep(unique_ghrelin_rats_rat_toy,"Emma","");
unique_ghrelin_rats_rat_toy = strrep(unique_ghrelin_rats_rat_toy,"Stitch","");
unique_ghrelin_rats_rat_toy(strcmpi(unique_ghrelin_rats_rat_toy,"")) = [];
disp(unique_ghrelin_rats_rat_toy)
unique_ghrelin_rats_rat_toy = strrep(unique_ghrelin_rats_rat_toy,"Pheobe", "phoebe");

for current_rat = 1:length(unique_ghrelin_rats_rat_toy)
    the_current_rat = unique_ghrelin_rats_rat_toy(current_rat);
%     disp(unique_ghrelin_rats_rat_toy(current_rat))
    list_of_dates_current_rat_ran = rat_toy_ghrelin_data.Date(strcmp(rat_toy_ghrelin_data.Name,unique_ghrelin_rats_rat_toy(current_rat)));
%     disp(list_of_dates_current_rat_ran)
    for current_date = 1:length(list_of_dates_current_rat_ran)
%         disp(list_of_dates_current_rat_ran(current_date))
        the_current_date = list_of_dates_current_rat_ran(current_date);
        query =strcat("SELECT subjectid,referencetime,feeder,approachavoid," + ...
            "rewardconcentration1,rewardconcentration2,rewardconcentration3,rewardconcentration4" + ...
            " FROM live_table " + ...
            "WHERE referencetime LIKE '",string(the_current_date),"%' AND LOWER(subjectid) = LOWER('",the_current_rat,"');");
%         disp(query)
        current_rat_and_date_results = fetch(conn,query);
        disp(current_rat_and_date_results)
%         current_rat_and_date_results = string(current_rat_and_date_results{:,:});
%         disp(current_rat_and_date_results)
        if height(current_rat_and_date_results) < 1
            disp(strcat(the_current_rat, " has no data on ",string(the_current_date)))
            continue
        end
        [xcoordinates,ycoordinates] = create_psychometric_function(current_rat_and_date_results);
        current_psychometric_function = table(strcat(the_current_rat, " ", the_current_date), ...
            xcoordinates(1),xcoordinates(2),xcoordinates(3),xcoordinates(4), ...
            ycoordinates(1),ycoordinates(2),ycoordinates(3),ycoordinates(4), ...
            'VariableNames',{'label','x1','x2','x3','x4','y1','y2','y3','y4'});

        table_of_psychometric_functions = [table_of_psychometric_functions;current_psychometric_function];
    end
end
disp(table_of_psychometric_functions)

close(conn)