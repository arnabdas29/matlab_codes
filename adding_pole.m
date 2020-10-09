% program to find the effect of adding a pole on the transient response of a second order system

clc

clear all

close all

num=24.542;

den=[1 4 24.542];

F=tf(num,den)

step(F)

hold on



num1=40*24.542;

den1=conv([1 40],[1 4 24.542]);

F1=tf(num1,den1)

step(F1)

legend({'original system','pole added at 40'},'FontSize',18,'FontWeight','bold')



num2=6*24.542;

den2=conv([1 6],[1 4 24.542]);

F2=tf(num2,den2)

step(F2)

legend({'original system','pole added at 40','pole added at 6'},'FontSize',18,'FontWeight','bold')