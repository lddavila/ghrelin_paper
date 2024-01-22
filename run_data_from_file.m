clc
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

table_of_rat_and_date_info = rmmissing(table_of_rat_and_date_info);
% disp(table_of_rat_and_date_info); 

number_of_rat_toy_sessions = height(table_of_rat_and_date_info(strcmpi(table_of_rat_and_date_info.Toy,"rat") & str2double(table_of_rat_and_date_info.Session)<6,:));
disp(strcat("Ghrelin Rat Number of Session 1-5:",string(number_of_rat_toy_sessions)))

number_of_stick_toy_sessions = height(table_of_rat_and_date_info(strcmpi(table_of_rat_and_date_info.Toy,"stick") & (5 < str2double(table_of_rat_and_date_info.Session) & str2double(table_of_rat_and_date_info.Session) < 8),:));
disp(strcat("Ghrelin Stick Number of Session 6-7:",string(number_of_stick_toy_sessions)))

number_of_skewer_toy_sessions = height(table_of_rat_and_date_info(strcmpi(table_of_rat_and_date_info.Toy,"skewer"),:));
disp(strcat("Ghrelin Skewer Number of Session 8-9:",string(number_of_skewer_toy_sessions)))

% disp(table_of_rat_and_date_info)
disp(height(table_of_rat_and_date_info))
ghrelin_toy_data = table_of_rat_and_date_info;
%% Get Session Counts For Saline Toy Sessions
disp("///////////////////////////////////")
table_of_rat_and_date_info = readtable('Ghrelin_info.xlsx','Sheet','Automatic Ghr ToyRAT Session #s');

% disp(table_of_rat_and_date_info)
session_number = string(table_of_rat_and_date_info.Var10);
saline_rat_names = string(table_of_rat_and_date_info.Var11);
saline_rat_session_dates = table_of_rat_and_date_info.Var12;
toy = string(table_of_rat_and_date_info.Var13);
table_of_rat_and_date_info = table(session_number,ghrelin_rat_names,ghrelin_rat_session_dates,toy,'VariableNames',{'Session','Name','Date','Toy'});
% % disp(table_of_rat_and_date_info)
table_of_rat_and_date_info = convertvars(table_of_rat_and_date_info,@isdatetime,@(t) datetime(t,'Format','MM/dd/yyyy'));
% % disp(table_of_rat_and_date_info)
% 
table_of_rat_and_date_info = rmmissing(table_of_rat_and_date_info);
% disp(table_of_rat_and_date_info); 
% 
number_of_rat_toy_sessions = height(table_of_rat_and_date_info(strcmpi(table_of_rat_and_date_info.Toy,"rat") & str2double(table_of_rat_and_date_info.Session)<6,:));
disp(strcat("Saline Rat Number of Session 1-5:",string(number_of_rat_toy_sessions)))

number_of_stick_toy_sessions = height(table_of_rat_and_date_info(strcmpi(table_of_rat_and_date_info.Toy,"stick") & (5 < str2double(table_of_rat_and_date_info.Session) & str2double(table_of_rat_and_date_info.Session) < 8),:));
disp(strcat("Saline Stick Number of Session 6-7:",string(number_of_stick_toy_sessions)))

number_of_skewer_toy_sessions = height(table_of_rat_and_date_info(strcmpi(table_of_rat_and_date_info.Toy,"skewer"),:));
disp(strcat("Saline Skewer Number of Session 8-9:",string(number_of_skewer_toy_sessions)))
% disp(table_of_rat_and_date_info)
disp(height(table_of_rat_and_date_info))
saline_toy_data = table_of_rat_and_date_info;

%% find the matching rat toy session data 
%disp(ghrelin_toy_data)
%disp(saline_toy_data)
clc
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


%% Construct ghrelin queries
conn = database('live_database','postgres','1234');

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
        

    end
end

close(conn)



















