%applies the forward Euler method to given functions with specific rules for current and voltage
%From Tutorial 2.3
function [voltage,w,spikes]=forwardEulerCurrent (voltageDiffEq,wDiffEq,E_L,dt,times,currents,vMax,V_Reset,b)
    
    arrLength=length(times);
    voltage=zeros(1,arrLength);
    voltage(1)=E_L;
    w=zeros(1,arrLength);
    spikes=zeros(1,arrLength);
    %Now iterating through arrays
    for index=1:arrLength-1
        %check if voltage is above max
        if(voltage(index)>vMax)
            voltage(index)=V_Reset;
             spikes(index)=1;
            w(index)=w(index)+b;
        end
    
    %update the voltage
    voltage(index+1)=voltage(index)+dt*voltageDiffEq(voltage(index),w(index),currents(index));
    %update the adaptation
    w(index+1)=w(index)+dt*wDiffEq(voltage(index),w(index));
    end 
end