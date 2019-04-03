%Jacob Smith Computational Neuroscience
function graph2PlotsV2(graphTitle,x1,x1Title,y1,y1Title,graphTitle2,x2,x2Title,y2,y2Title)
%%Grapsh the current and voltage of a nueron in the 
%same figure
figure("Name",graphTitle);
%uses general method to do graphinmg
subplot(2,1,1);
plotXY(x1,y1,graphTitle,x1Title,y1Title,false);
subplot(2,1,2); 
plotXY(x2,y2,graphTitle2,x2Title,y2Title,false);
end