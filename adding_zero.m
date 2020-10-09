% effect of adding a zero to a second order system

clc

clear all

close all

deng=[1 2 9];

Ta=tf([1 3]*9/3,deng);

Tb=tf([1 5]*9/5,deng);

Tc=tf([1 10]*9/10,deng);

T=tf(9,deng);

step(T,Ta,Tb,Tc)

legend({'no zero','zero at -3','zero at -5','zero at -10'},'FontSize',18,'FontWeight','bold')

