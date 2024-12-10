%filterbuilder
%fvtool(Hlp2);
[a, b]=tf(Hlp);

Fs=1000;
X=0:1/Fs:10-1/Fs;
Y=sin(2*pi*10*X);
subplot(3,1,1);
plot(X,Y);
grid;
title('Синусоида');
xlabel('Время, с');
ylabel('Значение');
xlim([0 1]);
ylim([-1.65 1.65]);


noise=0.5*sin(2*pi*100*X);

Y_n=Y+noise;


subplot(3,1,2);
Y_f=filter(a,b,Y_n);
plot(X,Y_f);
grid;
title('Синусоида после фильтрации');
xlabel('Время, с');
ylabel('Значение');
xlim([0 1]);
ylim([-1.65 1.65]);

subplot(3,1,3);
N=length(Y_f);
Y_n2=zeros(1,N);
for i=1:N
    Y_n2(i)=Y_f(N-i+1);
end
Y_f2=filter(a,b,Y_n2);
Y_f2=Y_f2*-1;
plot(X,Y_f2);
grid;
title('Синусоида после обратной прогонки');
xlabel('Время, с');
ylabel('Значение');
xlim([0 1]);
ylim([-1.65 1.65]);

pause;


subplot(3,1,1);
W=fft(Y);
n=length(Y);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
stem(fshift,abs(wshift));
grid;
title('Амплитудный спектр синусоиды');
xlabel('Частота, Гц');
ylabel('Амплитуда');
xlim([0 105]);
ylim([0 1.1]);


subplot(3,1,2);
W=fft(Y_f);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
stem(fshift,abs(wshift));
grid;
title('Амплитудный спектр синусоиды после фильтра');
xlabel('Частота, Гц');
ylabel('Амплитуда');
xlim([0 105]);
ylim([0 1.1]);

subplot(3,1,3);
W=fft(Y_f2);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
stem(fshift,abs(wshift));
grid;
title('Амплитудный спектр синусоиды после обратной прогонки');
xlabel('Частота, Гц');
ylabel('Амплитуда');
xlim([0 105]);
ylim([0 1.1]);
pause;



subplot(3,1,1);
W=fft(Y);
n=length(Y);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % Модуль спектра
phase_spectrum = angle(wshift);         % Фаза спектра
threshold = max(amplitude_spectrum) * 0.1; % 10% от максимальной амплитуды
significant_indices = amplitude_spectrum > threshold; % Только значимые частоты

stem(fshift(significant_indices), phase_spectrum(significant_indices));
grid;
title('Фазовый спектр синусоиды');
xlabel('Частота, Гц');
ylabel('Фаза');
xlim([0 105]);
ylim([-2.5 0.2]);



subplot(3,1,2);
W=fft(Y_f);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % Модуль спектра
phase_spectrum = angle(wshift);         % Фаза спектра
threshold = max(amplitude_spectrum) * 0.1; % 10% от максимальной амплитуды
significant_indices = amplitude_spectrum > threshold; % Только значимые частоты

stem(fshift(significant_indices), phase_spectrum(significant_indices));
grid;
title('Фазовый спектр синусоиды после фильтра');
xlabel('Частота, Гц');
ylabel('Фаза');
xlim([0 105]);
ylim([-2.5 0.2]);


subplot(3,1,3);
W=fft(Y_f2);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % Модуль спектра
phase_spectrum = angle(wshift);         % Фаза спектра
threshold = max(amplitude_spectrum) * 0.1; % 10% от максимальной амплитуды
significant_indices = amplitude_spectrum > threshold; % Только значимые частоты

stem(fshift(significant_indices), phase_spectrum(significant_indices));
grid;
title('Фазовый спектр синусоиды после обратной прогонки');
xlabel('Частота, Гц');
ylabel('Фаза');
xlim([0 105]);
ylim([-2.5 0.2]);