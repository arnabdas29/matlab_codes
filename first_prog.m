% Creating a transfer function in MATLAB using TF  command

clc

clear all

num=32;

den=[1 12 32 0];

F=tf(num,den)



%Creating a transfer function in MATLAB using zpk  command


clc

clear all

zerof=[];

polef=[0 -4 -8];

gainf=32;

F=zpk(zerof,polef,gainf)



% finding partial fractions using residue command


clc

clear all

numf=32;

denf=[1 12 32 0]; 

[resdf,polef,constf]=residue(numf,denf)



% using symbolic math to find laplace transform

clc

clear all

syms a t

f=exp(-a*t);

p=laplace(f)

pretty(p)





clc

clear all

syms a t

f = t*exp(-a*t)

pretty(laplace(f))



% using symbolic math to find inverse laplace transform


clc

clear all

syms s

f=ilaplace(32/(s*(s^2+12*s+32)))

pretty(f)



clc

clear all

syms s

C=1/(s*(s+2))

C=ilaplace(C)

pretty(C)



% finding the step response using step command

clc

clear all

close all

num=16;

den=[1 3 16];

F=tf(num,den)

step(F)



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