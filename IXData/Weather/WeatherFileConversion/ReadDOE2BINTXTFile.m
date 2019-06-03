function [m,ColumnDescription,dateVec] = ReadDOE2BINTXTFile(filename,year)
% this *.txt files have the following columns of information:
% Column Number   Variable      Description         Units
%C 1              IM2            MOMTH              (1-12)
%C 2             ID             DAY OF MONTH
%C 3             IH             HOUR OF DAY
%C 4             CALC(1)        WET BULB TEMP      (DEG F)
%C 5             CALC(2)        DRY BULB TEMP      (DEG F)
%C 6             CALC(3)        PRESSURE           (INCHES OF HG)
%C 7             CALC(4)        CLOUD AMOUNT       (0 - 10)
%C 8             ISNOW          SNOW FLAG          (1 = SNOWFALL)
%C 9             IRAIN          RAIN FLAG          (1 = RAINFALL)
%C 10            IWNDDR         WIND DIRECTION     (0 - 15; 0=N, 1=NNE, ETC)
%C 11            CALC(8)        HUMIDITY RATIO     (LB H2O/LB AIR)
%C 12            CALC(9)        DENSITY OF AIR     (LB/CU FT)
%C 13            CALC(10)       SPECIFIC ENTHALPY  (BTU/LB)
%C 14            CALC(11)       TOTAL HOR. SOLAR   (BTU/HR-SQFT)
%C 15            CALC(12)       DIR. NORMAL SOLAR  (BTU/HR-SQFT)
%C 16            ICLDTY         CLOUD TYPE         (0 - 2)
%C 17            CALC(14)       WIND SPEED         KNOTS
ColumnDescription = {'MOMTH (1-12)' ...
    'DAY OF MONTH' ...
    'HOUR OF DAY' ...
    'WET BULB TEMP (DEG F)' ...
    'DRY BULB TEMP (DEG F)' ...
    'PRESSURE (INCHES OF HG)' ...
    'CLOUD AMOUNT (0 - 10)' ...
    'SNOW FLAG (1 = SNOWFALL)' ...
    'RAIN FLAG (1 = RAINFALL)' ...
    'WIND DIRECTION (0 - 15; 0=N, 1=NNE, ETC)' ...
    'HUMIDITY RATIO (LB H2O/LB AIR)' ...
    'DENSITY OF AIR (LB/CU FT)' ...
    'SPECIFIC ENTHALPY (BTU/LB)' ...
    'TOTAL HOR. SOLAR (BTU/HR-SQFT)' ...
    'DIR. NORMAL SOLAR (BTU/HR-SQFT)' ...
    'CLOUD TYPE (0 - 2)' ...
    'WIND SPEED (KNOTS)'};
h = fopen(filename);
text = fgetl(h);
text = fgetl(h);
text = fgetl(h);
m = zeros(8760,17);
EntryLength = [2 2 2 5 5 6 5 3 3 4 7 6 6 7 7 3 5];
NumCol = length(EntryLength);
j = 1;
while ~feof(h)
    text = fgetl(h);
    Pos = 1;
    for i = 1:NumCol
        m(j,i) = str2double(text(Pos:Pos+EntryLength(i)-1));
        Pos = Pos + EntryLength(i);
    end
    j = j + 1;
end

dateVec = datenum(year,m(:,1),m(:,2),m(:,3),0,0);
fclose(h);