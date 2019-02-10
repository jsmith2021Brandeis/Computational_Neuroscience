%Uses the Forward Euler method to plot the solution of the given
%differential equation
%This is for exercise 2.1, I need a special if statement to lower voltage
%which I am representing with the secondary Equations
%changing Term allows me to modify the currents over different plots
function spikeCount=forwardEuler(voltage,secondaryEq,doingSecond,changingTerm,finalTime,dt,xInit,graphTitle,xTitle,yTitle)
%start spikeCount at 0
spikeCount=0;
%create arrays and set initial condition
%returns the number of spikes
times=0:dt:finalTime;
arrLength=length(times);
xVals=zeros(1,arrLength);
xVals(1)=xInit;
%iterate through array, finding the next x value
for index=1:arrLength-1
    x=xVals(index);
    voltageVal=voltage(x,dt,changingTerm);
    %Secondary equation in case function calls for some reset condition
    if (doingSecond)
        [voltageVal,didSpike]=secondaryEq(voltageVal);
    end
    %increment spike count by whether a spike occured
    spikeCount=spikeCount+didSpike;
    xVals(index+1)=voltageVal;
end
%label figure
plot(times,xVals);
title(graphTitle);
xlabel(xTitle);
ylabel(yTitle);
return;
end