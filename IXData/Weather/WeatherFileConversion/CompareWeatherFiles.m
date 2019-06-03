clear;
filesToCompare = {...%'NM_Albuquerque_Intl_ArptTMY3.txt';...
    'USA_NM_Albuquerque.Intl.AP.723650_TMY3.txt';...
    'ABQ_HadCM3_A2_2020.txt';...
    'ABQ_HadCM3-A2-2050.txt';...
    'ABQ_HadCM3-A2-2080.txt'};
year = [2015 2015 2020 2050 2080];

LineSpec = {'-k','-b','-r','-g','-c'};
NumFile = length(filesToCompare);

m = cell(NumFile,1);
for i = 1:NumFile
    [m{i},ColumnDescription,dateVec] = ReadDOE2BINTXTFile(filesToCompare{i},year(i));
end

NumColumn = length(ColumnDescription);

% hourly plots
% for j = 1:NumColumn
%     figure(j);
%     clf(j);
%     for i = 1:NumFile
%         plot(dateVec,m{i}(:,j),LineSpec{i})
%         hold on;
%     end
%     ylabel(ColumnDescription(j));
% end

% daily plots
M = zeros(size(m{1},1)/24,NumColumn,NumFile);
for i = 1:length(filesToCompare)
    temp = m{i};
    if i == 1
        DayDateVec = zeros(size(M,1),1);
        DayDateVec(1) = datenum(year(i),1,1,1,0,0);
    end
    for j = 1:size(M,1)
        M(j,:,i) = mean(temp(24*(j-1)+1:24*j,:),1);
        if j >= 2 && i == 1
           DayDateVec(j) = addtodate(DayDateVec(j-1),1,'day');
        end
    end
end
for j = 1:NumColumn
    figure(NumColumn + j);
    clf(NumColumn + j);
    set(gcf,'Color','White');
    for i = 1:NumFile
        plot(DayDateVec,M(:,j,i),LineSpec{i})
        hold on;
    end
    grid on;
    ylabel(ColumnDescription(j));
    startDate = datenum(year(1),1,1,1,0,0);
    endDate = datenum(year(1),12,31,1,0,0);
    dateDat = linspace(startDate,endDate,12);
    set(gca,'XTick',dateDat)
    datetick('x','mmm','keepticks');
end