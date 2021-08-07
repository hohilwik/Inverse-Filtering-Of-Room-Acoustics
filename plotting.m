Fs = 44100;                           % Sampling frequency                    
T = 1/Fs;                             % Sampling period       
L = length(SrcSignalVec);             % Length of signal
t = (0:L-1)*T;                        % Time vector

Y = fft(SrcSignalVec);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
signal1 = P1;

f = Fs*(0:(L/2))/L;
figure;
plot( f(1:400000) , P1(1:400000) ) 
title('Single-Sided Amplitude Spectrum of SrcSignalVec')
xlabel('f (Hz)')
ylabel('|P1(f)|')

Y2 = fft(AuData(:,1));
P2 = abs(Y2/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
signal2 = P1;

f = Fs*(0:(L/2))/L;
figure;
plot( f(1:400000) , P1(1:400000) ) 
title('Single-Sided Amplitude Spectrum of AuData Mic 1')
xlabel('f (Hz)')
ylabel('|P1(f)|')

figure;
difference = signal1-signal2;
plot( f(1:400000) , difference(1:400000) ) 

figure;
divide = signal2./signal1;
plot( f(1:441000) , 20*log10( abs(divide(1:441000) )) ) 
title('Power Spectra of Room Response')
xlabel('freq(Hz)')
ylabel('Magnitude(dB)')

inverseH = ifft(1./divide(1:400000));

reconX = freq_conv( AuData(:,1),inverseH );
audiowrite('badinversefilter1.wav', reconX, 44100);
reconX = freq_conv( AuData(:,2),inverseH );
audiowrite('badinversefilter2.wav', reconX, 44100);


NUM=1024;
y1 = fft( AuData(:,1), NUM);
xsignal= fft(SrcSignalVec,NUM);
h1 = y1./xsignal
y2 = fft( AuData(:,2), NUM);
h2 = y2./xsignal;
figure;
plot(0:NUM-1, abs(xsignal));

figure;
subplot(2,2,1);
plot(0:NUM-1, abs(y1));
subplot(2,2,2);
plot(0:NUM-1, abs(y2));
subplot(2,2,3);
plot(0:NUM-1, abs(h1));
subplot(2,2,4);
plot(0:NUM-1, abs(h2));