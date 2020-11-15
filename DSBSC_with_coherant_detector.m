% Amplitude Modulation DSB-SC

Am=2;
Ac=1;
m=Am/Ac;
fm=100;
fc=10*fm;
Fs=5*fc;
T=1/Fs;
t=0:T:0.1;

% message signal
xm = Am*cos(2*pi*fm*t);
N = length(xm);
subplot(421);
plot(t,xm);xlabel('Time');ylabel('Amplitude');title('Message signal');

% carrier signal
xc = Ac*cos(2*pi*fc*t);
subplot(422);
plot(t,xc);xlabel('Time');ylabel('Amplitude');title("Carrier signal");

%MODULATION
% DSB-SC
y1 = xm.*xc;
subplot(423);
plot(t,y1);xlabel('Time');ylabel('Amplitude');title("DSB-SC");

% Spectrum of DSB-SC
Y11 = fftshift(fft(y1,N))/length(t);
f = Fs*[-N/2:N/2-1]/N;
subplot(424);
plot(f,abs(Y11));xlabel('Frequency');ylabel('Amplitude');title("Spectrum of DSB-SC");xlim([-(fc+500),(fc+500)]);

%SSB-LSB
ssbamp = Am.*Ac/2;
y2 = ssbamp.*cos(2*pi*(fc-fm)*t);
subplot(425);
plot(t,y2);xlabel('Time');ylabel('Amplitude');title("SSB-LSB");

% Spectrum of SSB
Y22 = fftshift(fft(y2,N))/length(t);
f = Fs*[-N/2:N/2-1]/N;
subplot(426);
plot(f,abs(Y22));xlabel('Frequency');ylabel('Amplitude');title("Spectrum of SSB-LSB");xlim([-(fc+500),(fc+500)]);

%DEMODULATION
%coherent demodulator
phasedif = 0;
repcarrier = Ac*cos(2*pi*fc*t+phasedif);
mi = y1.*repcarrier; %DSB-SC signal

%designing butterworth lowpass filter
fc = fm; %fc is cutoff freq
[b,a] = butter(10,fc/(Fs/2),'low'); % filter of order 10

%filtered output i.e., passing the DSB-SC signal(Y1)
output = filter(b,a,mi);
subplot(427);
plot(t,output);xlabel('Time');ylabel('Amplitude');title("output");

%spectrum of filtered output
N = length(output);
output1 = fftshift(fft(output,N))/length(t);
f = Fs*[-N/2:N/2-1]/N;
subplot(428);
plot(f,abs(output1));xlabel('Frequency');ylabel('Amplitude');title("Spectrum of output");xlim([-(fm+50),(fm+50)]);