%Jacob SMith 2.3.2019 jsmith2021@brandeis.edu NBIO 140b
%for Tutorial 2.1, creates many plots of solutions to differential
%equations to compare parameters
function firingRates=EulerManyPlots(voltage,drop,usingSecond,finalTime,dt,El,appliedCurrents,appliedCurrentNames,numIterations,graphTitle,xTitle,yTitle)
%create array to store firingRates, stored in spikes per second
arrLength=length(appliedCurrents);
firingRates=zeros(1,arrLength);

figure('Name',graphTitle);
%Iterates over the Forward Ueler function 
 %Useful when comparing many paramaters
 %calculate how big the square of subplots hould be
 sideLength=ceil(sqrt(numIterations));
 %iterate through all plots produced
for plotNum =1:numIterations
    %for that position in the subplot
    subplot(sideLength,sideLength,plotNum);
    %run a forward Euler procedure to find the solution to that
    %differential equation
    appliedCurrent=appliedCurrents(plotNum);
    spikeCount=forwardEuler(voltage,drop,usingSecond,appliedCurrent,finalTime,dt,El,appliedCurrentNames(plotNum)+" F Current",xTitle,yTitle);
    %convert spikeCount to rate of spikes and add to array
    firingRates(plotNum)=spikeCount/finalTime;
end
end

