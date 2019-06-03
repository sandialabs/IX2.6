function [data8760NaNWhereMissing,columnDescription] = ReadSkysparkCSVOutputFromHistories(Path,timevector)
    % This function has manually inputs that will need changing as Skyspark
    % changes. They are at the beginning of the function
    %
    undesiredUnits = {'°F','%RH'};
    splitDateDelimiters = ["-",":","T"," "];
    numHourInYear = 8760;
    
    % begin of the function
    TempTable = readtable(Path,'Delimiter',',');
    TempStrArr = string(TempTable.Variables);
    DateStrArr = split(TempStrArr(:,1),splitDateDelimiters);
    year_vec = str2double(DateStrArr(:,1));
    month_vec = str2double(DateStrArr(:,2));
    day_vec = str2double(DateStrArr(:,3));
    hour_vec = str2double(DateStrArr(:,4));
    % find the missing gaps
    numhour = length(hour_vec);

    data_gaps = str2double(replace(TempStrArr(:,2:end),undesiredUnits,''));
    date_vec = [year_vec month_vec day_vec hour_vec zeros(numhour,1) zeros(numhour,1)];
   
    data8760NaNWhereMissing = fillMissingDataWithNaN(date_vec,data_gaps,timevector);
    
    columnDescription = TempTable.Properties.VariableNames(2:end);
end