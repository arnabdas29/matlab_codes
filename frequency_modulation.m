% frequency modulation

fm=100;
fc=10*fm;
B=10;
F=1e4;
T=1/F;
t=0:T:0.1;
m=cos(2*pi*fm*t);
subplot(3,1,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
 
c=cos(2*pi*fc*t);
subplot(3,1,2);
plot(t,c);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');

y=cos(2*pi*fc*t+(B*sin(2*pi*fm*t)));
subplot(3,1,3);
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title('Frequency modulation');
