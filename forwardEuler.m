%Uses the Forward Euler method to plot the solution of the given
%differential equation
%This is for exercise 2.1, I need a special if statement to lower voltage
%which I am representing with the secondary Equations
%changing Term allows me to modify the currents over different plots

function spikeCount=forwardEuler(functions,changingTerm,finalTime,dt,xInit,graphTitle,xTitle,yTitle)
%start spikeCount at 0
spikeCount=0;
%create arrays and set initial condition
%returns the number of spikes
times=0:dt:finalTime;
arrLength=length(times);
xVals=zeros(1,arrLength);
xVals(1)=xInit;

gSRAVals=zeros(1,arrLength);
gSRAVals(1)=0;%redundant, zeros starts at 0
%iterate through array, finding the next x value
for index=1:arrLength-1
    x=xVals(index);
    gSRA=gSRAVals(index);
    
    %equation to update the voltage
    voltageVal=functions{1}(x,dt,changingTerm,gSRA);
  
    %equation to update the gSRA
    gSRA=functions{2}(gSRA,dt);
      %Secondary equation in case function calls for some reset condition
    [voltageVal,didSpike,gSRA]=functions{3}(voltageVal,gSRA);
    
     %increment spike count by whether a spike occured
    spikeCount=spikeCount+didSpike;
    
    gSRAVals(index+1)=gSRA;
    xVals(index+1)=voltageVal;
end
%label figure
plot(times,xVals);
title(graphTitle);
xlabel(xTitle);
ylabel(yTitle);
return;
end