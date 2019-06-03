function fignumout = plotwithmypreferences(fignum,time,x,strylabel,legendlabels)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   mycolors = ['-b','-k','-r','-g'];
   if size(x,2) > length(mycolors)
      error(['This function only handles ',length(mycolors),' vectors.']); 
   end

        figure(fignum);
        clf;
        set(gcf,'Color','White');
        hold on;
        for i = 1:size(x,2)
           plot(time,x(:,i));
        end
        xlabel('hours since January 1, 2017');
        ylabel(strylabel);
        legend(legendlabels);

        fignumout = fignum;
        strylabel_post = regexprep(strylabel,'[/\(\)\*\. ]?','_');
        saveas(fignum,['WeatherComparison',strylabel_post,'.png']);
end

