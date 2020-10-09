% Amplitude Modulation

Am=2;
Ac=0.03;
m=Am/Ac;
fm=100;
fc=500000;
Fs=2*fc;
T=1/Fs;
t=0:T:0.1;

% message signal
xm = Am*cos(2*pi*fm*t);
subplot(421);
plot(t,xm);xlabel('Time');ylabel('Amplitude');title('Message signal');

% carrier signal
xc = Ac*cos(2*pi*fc*t);
subplot(422);
plot(t,xc);xlabel('Time');ylabel('Amplitude');title("Carrier signal");

% DSB-AM 
y = Ac*(1+m*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
subplot(423);
plot(t,y);xlabel('Time');ylabel('Amplitude');title("Amplitude Modulation");

amm = ammod(xm,fc,Fs,0,Ac);
subplot(424)
plot(t,amm);xlabel('Time');ylabel('Amplitude');title("Amplitude Modulation-inbuilt func");

% Spectrum of modulated wave
N = length(xm);
Y = fftshift(fft(y,N));
f = Fs*[-N/2:N/2-1]/N;
subplot(425);
plot(f,Y);xlabel('Frequency');ylabel('Amplitude');title("Spectrum of modulated wave");

