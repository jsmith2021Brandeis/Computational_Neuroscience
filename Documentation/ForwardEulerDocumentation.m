%Computational Neuroscience Library Jacob Smith
%This example script uses the Forward Euler method to model a neuron
%Using the Leakly Integrate and Fire Model with a voltage reset function to
%tirgger voltage drops

%Define constants
clear;
%step i
El=-70*10^-3;%Equilibrium potential in volts
%defining conducance insetad of resistance
Rm=5*10^6;%Resistance of membrane in ohms
Gl=1/Rm;
Cm=2*10^-9;%capacitance of membrane? in farads
Vth=-50*10^-3;%threshold voltage of neuron in milli volts
Vr=-65*10^-3;%reset potential of neuron in volts
%steps ii through viii are done in these two lines
appliedCurrents=4.01*10^-9;%applied current of to cell 

%differential equation being modelled, Leaky Integrate and Fire Model
%be modifed dividing by cM in voltage function so current is too
diffEq=@(v)(((El-v)/Rm));
%the voltage drop function
drop = @(x) voltageDrop(x, Vth,Vr);
%the term used in the forwardEuler method, defined outside the function to
%allow for user flexibility
voltage=@(x,dt,changingTerm)x+dt*((diffEq(x)+changingTerm)/Cm);
forwardEuler(voltage,drop,true,appliedCurrents,2,.0001,El,"Leaky Integrate and Fire Model","Time (s)","Voltage (volts)");
%forwardEuler(voltage,secondaryEq,doingSecond,changingTerm,finalTime,dt,xInit,graphTitle,xTitle,yTitle)
%EulerManyPlots(voltage,drop,true,.2,.00001,El,appliedCurrents,appliedCurrentNames,numPlots,,);

%plot analytical solution
%the defined voltage function, allowing me to seperate the functionality
%of solving the differential equation from casuing the neuron to spike
function [voltage,didSpike]=voltageDrop(v,vTh,Vr)
%pass the voltage, voltage threhsold and initial voltage
%simulates the voltage drop by lowering voltage to
%initial if it gets above threshold
%returns whether the nueron spiked
    voltage=v;
    didSpike=0;
    if(v>vTh)
        voltage=Vr;
        didSpike=1;
        return;
    end
end
