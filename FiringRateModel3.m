%% 
% Tutorial 6.1
% 
% Computational Neuroscience
% 
% This Tutorial plots the firing rate as a function of synaptic input
% 
% Page 14 of Computational Neuroscience Textbook by Paul Miller

%Default Parameters and Functions for the whole simulaiton
clear;

%where s is a vector
SynapticInputS=@(s,r0,rMax,x,sig)(r0+rMax*(s.^x)/(s.^x+sig^x));%sIn ==0
DepressionSteadyState=@(pr,r,tD)(1/(1+pr*r*tD));
SynapticInputR=@(r,a0,D,pr,Ts)((a0*D*pr*r*Ts)./(1+a0*D*pr*r*Ts));

%Problem 1
%a
x=1.2;
sig=0.5;
r0=.1;
rMax=100;%100 hz
sInput=0:.05:1;%Synaptic Input from 0 to 1
sTotalS=SynapticInputS(8*sInput,r0,rMax,x,sig);%total Synatpic Input
firingRates=0:1:100;%firing rate in Hertz
sTotalR=SynapticInputR(firingRates,.5,1,1,2e-3);%total synaptic input
graph2PlotsV2("Tutorial 6.1.1 Synaptic Input Function",sInput,"Synaptic Gating Variable",sTotalS,"Total Synaptic Input","Firing Rate Function",firingRates,"Firing Rate ",sTotalR,"Synaptic Gating Variable");

%b
TR=1;
WEE=8;
dt=.001;
finalTime=20;
dt=.001;
TD=1;
pr=1;
Dr=1;
Ts=2e-3;
a0=.5;
%create vector of s inputs
times=0:dt:finalTime;
sIn=zeros(size(times));
start=10/dt;
sIn(start:start+50e-3/dt)=.1;

  %hardcoding secnodary function to handle error
 firingRateDiffEq=@(r,s,sIn,r0,x,sig)((-r+((r0+rMax*(s^x)/(s^x+sig^x))))/TR);
 depressionDiffEq=@(D,TD,pr,Dr)((1-D)/(TD)-pr*Dr);
 synapticInputDiffEq=@(s,Ts,a0,D,pr,r)(-s/Ts+a0*D*pr*r*(1-s)); 


 [times,firingRates,depressions,synapticInputs]=firingRateModelForwardEuler (times,dt,TD,pr,Dr,Ts,a0,r0,x, sig,firingRateDiffEq,depressionDiffEq,synapticInputDiffEq,sIn,SynapticInputS);
 graph3Plots (times,firingRates,depressions,synapticInputs,"Tutorial 6.1.b","Firing Rate","Depression","Synaptic Inputs","Time (s)","Firing Rate","Depressions","Synaptic Inputs");

%Jacob Smith Computational Neuroscience Tutorial 6.1
%Ideally would just be forwardEuler with provided current, see Tutorial 3 backups where I tried to do that
function [times,firingRates,depressions,synapticInputs]=firingRateModelForwardEuler (times,dt,TD,pr,Dr,Ts,a0,r0,x,sig,firingRateDiffEq,depressionDiffEq,synapticInputDiffEq,sIn,SynapticInputS)

    %applies the forward Euler method to specific functions with specific rules for current and voltage
    arrLength=length(times);
    firingRates=zeros(1,arrLength);
    depressions=zeros(1,arrLength);
    synapticInputs=zeros(1,arrLength);
    %Now iterating through arrays
    for index=1:arrLength-1
       firingRates(index+1)=firingRates(index)+dt*firingRateDiffEq(firingRates(index),synapticInputs(index),sIn(index),r0,x,sig);
       depressions(index+1)=depressions(index)+dt*depressionDiffEq(depressions(index),TD,pr,Dr);
        synapticInputs(index+1)=synapticInputs(index)+dt*synapticInputDiffEq(synapticInputs(index),Ts,a0,depressions(index),pr,firingRates(index));
    end 
end

%%Other Helper functions

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



