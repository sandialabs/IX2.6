%% From TXT2BIN.FMT - this gives the exact format needed to output a
%                     text file that TXT2BIN.EXE can process.
%       THIS DOCUMENTS A FORMATTED WEATHER FILE (WEATHER.FMT) MADE FROM
%       A PACKED BINARY DOE2 WEATHER FILE (WEATHER.BIN) USING WTHFMT2.EXE
%       AND THE EXTRA FILE NEEDED (not really!) TO PACK IT WITH FMTWTH2.EXE
%  
% on input.dat:              
% 
% Record 1       IWSZ,IFTYP
%                FORMAT(12X,I1,17X,I1)     
% 
%       IWSZ           WORD SIZE          1 = 60-BIT, 2 = 30-BIT
%       IFTYP          FILE TYPE          1 = OLD, 2 = NORMAL (NO SOLAR),
%                                         3 = THE DATA HAS SOLAR
% on weather.fmt:              
% 
% Record 1       (IWDID(I),I=1,5),IWYR,WLAT,WLONG,IWTZN,IWSOL
%                FORMAT(5A4,I5,2F8.2,2I5)     
% 
% Record 2       (CLN(I),I=1,12)
%                FORMAT(12F6.2)      
% 
% Record 3       (GT(I),I=1,12)
%                FORMAT(12F6.1)
% 
% Records 4,8763
%                KMON, KDAY, KH, WBT, DBT, PATM, CLDAMT, ISNOW, 
%                IRAIN, IWNDDR, HUMRAT, DENSTY, ENTHAL, SOLRAD,
%                DIRSOL, ICLDTY, WNDSPD
%                FORMAT(3I2,2F5.0,F6.1,F5.0,2I3,I4,F7.4,F6.3,F6.1,2F7.1,I3,F5.0)      
%       IWDID          LOCATION I.D.
%       IWYR           YEAR
%       WLAT           LATITUDE
%       WLONG          LONGITUDE
%       IWTZN          TIME ZONE NUMBER
%       IWSOL          SOLAR FLAG         IWSOL = IWSZ + (IFTYP-1)*2 - 1
%       CLN            CLEARNESS NO.
%       GT             GROUND TEMP.       (DEG R)
%       KMON           MONTH              (1-12)
%       KDAY           DAY OF MONTH
%       KH             HOUR OF DAY
%       WBT            WET BULB TEMP      (DEG F)
%       DBT            DRY BULB TEMP      (DEG F)
%       PATM           PRESSURE           (INCHES OF HG)
%       CLDAMT         CLOUD AMOUNT       (0 - 10)
%       ISNOW          SNOW FLAG          (1 = SNOWFALL)
%       IRAIN          RAIN FLAG          (1 = RAINFALL)
%       IWNDDR         WIND DIRECTION     (0 - 15; 0=N, 1=NNE, ETC)
%       HUMRAT         HUMIDITY RATIO     (LB H2O/LB AIR)
%       DENSTY         DENSITY OF AIR     (LB/CU FT)
%       ENTHAL         SPECIFIC ENTHALPY  (BTU/LB)
%       SOLRAD         TOTAL HOR. SOLAR   (BTU/HR-SQFT)
%       DIRSOL         DIR. NORMAL SOLAR  (BTU/HR-SQFT)
%       ICLDTY         CLOUD TYPE         (0 - 2)
%       WNDSPD         WIND SPEED         KNOTS


%%

function WriteDoe2WeatherBINFileFromArray(array,final_file_name,sitestr,...
    wyear,wlat,wlong,timezone,solarflag,clearness_numbers,...
    ground_temp,word_size,file_type,exepath,numHourInYear,tempDirName)
    
    % we are already in tempDirName
    
    % array must have the order given above for records 4,8763. precision
    % is pretty low in the final file.

    if size(array,1) ~= numHourInYear || size(array,2) ~= 17
        error(sprintf('%s%5i%s','This function only allows input of a ',...
            numHourInYear,'x12 matrix! The order of the 17 columns must be that expressed in TXT2BIN.FMT.'));
    % a lot more input checks could be givne but we are not going to give
    % them.
    end
        
    cdir = pwd;
    
    foldernames = split(cdir,'\');
    % only change the directory if you are not already in it!
    if ~strcmp(foldernames{end}, tempDirName)
        if exist(tempDirName,'dir') == 0
            mkdir(tempDirName);
        end
        cd(tempDirName);
    end
    
    copyfile(exepath,pwd);
    
    try
       delete input.dat weather.fmt 
    catch
       error(['The files input.dat and weather.fmt must be closed so',
           ' that this routine can delete them!']);
    end
    % write the input.dat file
    fid = fopen('input.dat','w');
    fprintf(fid,'            %1.0f                 %1.0f',[word_size,file_type]);
    fclose(fid);
    
    fid = fopen('weather.fmt','w');
    
    % header information
    fprintf(fid,'%20s%5i%8.2f%8.2f%5i%5i\n',...
        sitestr,wyear,wlat,wlong,timezone,solarflag);
    % header line2
    fprintf(fid,'%6.2f',clearness_numbers);
    fprintf(fid,'%s\n','');
    % header line3
    fprintf(fid,'%6.1f',ground_temp);
    fprintf(fid,'%s\n','');
       
    BINformatstr = '%2.0f%2.0f%2.0f%4.0f.%4.0f.%6.1f%4.0f.%3.0f%3.0f%4.0f%7.4f%6.3f%6.1f%7.1f%7.1f%3.0f%4.0f.\n';
    for i=1:numHourInYear
       fprintf(fid,BINformatstr,array(i,:));
    end
    fclose(fid);
    
    !TXT2BIN.EXE
    
    copyfile('WEATHER.BIN',[cdir,'\',final_file_name]);
    cd ..
    
end

