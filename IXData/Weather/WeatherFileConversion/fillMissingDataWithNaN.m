function data8760NaNWhereMissing = fillMissingDataWithNaN(date_vec,data_with_gaps,timevector)

    %% The begin date and time must become 
    datetime_vec = datetime(date_vec);
    TT1 = timetable(datetime_vec,data_with_gaps);
    TT2 = retime(TT1,timevector);
    data8760NaNWhereMissing = TT2.data_with_gaps;
end