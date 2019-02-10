%Jacob Smith Nbio140b jsmith2021@brandeis.edu
%helper function to make cretaing graphs easier
function plotXYNewFig(X,Y,graphTitle,xTitle,yTitle)
%Creates a simple plot of two vectors and labels
figure("Name",graphTitle);
hold on;
title(graphTitle);
xlabel(xTitle);
ylabel(yTitle);
plot(X,Y);
end

