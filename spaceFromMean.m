%Jacob Smith 2.4.2019 NBIO 140b, for use in testing differnet currents
function vector = spaceFromMean(mean,numSpaces)
%Generates a vector of n+1 elemtns that is evenly spaced around the mean
% returns that vector
%start at 0
a=0;
%end at 2 times the mean
b=2*mean;
%go by this amount to get from 0 to mean, minus one because 0:dt:2*mean;
dx=b/(numSpaces-1);
vector=a:dx:b;
return;
end

