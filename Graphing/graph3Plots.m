%generates a 3 part plot from given arrays and titles
%From Tutorial 2.3
function graph3Plots (x,y1,y2,y3,graphTitle,plotTitle1,plotTitle2,plotTitle3,xTitle,yTitle1,yTitle2,yTitle3)
    figure("Name",graphTitle);    
    %label figure
    subplot(3,1,1);
    plot(x,y1);
    title(plotTitle1);
    ylabel(yTitle1);
    subplot(3,1,2);
    plot(x,y2);
    title(plotTitle2);
    ylabel(yTitle2);
    subplot(3,1,3);
    plot(x,y3);
    title(plotTitle3);
    ylabel(yTitle3);
    xlabel(xTitle);    
end