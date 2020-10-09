clc
clear all
close all 
num=1;
den = conv([1 1], conv([1 2],[1 3]));
sys = tf(num,den);
sys1 = zpk(sys)
rlocus(sys1)
%sgrid
sgrid([0 0.707],[0 5])