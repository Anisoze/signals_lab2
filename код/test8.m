% Параметры сигнала
Fs = 1000;          % Частота дискретизации, Гц
T = 1;              % Длительность сигнала, секунды
t = 0:1/Fs:T-1/Fs;  % Временная шкала
f_signal = 10;      % Частота синусоиды, Гц

% Синусоидальный сигнал
x = sin(2*pi*f_signal*t);

% Преобразование Фурье
N = length(x);           % Длина сигнала
X = fft(x);              % Прямое FFT
frequencies = (0:N-1)*(Fs/N); % Частотная шкала

% Амплитудный и фазовый спектры
amplitude_spectrum = abs(X);       % Модуль спектра
phase_spectrum = angle(X);         % Фаза спектра

% Порог для отбора значимых частот
threshold = max(amplitude_spectrum) * 0.1; % 10% от максимальной амплитуды
significant_indices = amplitude_spectrum > threshold; % Только значимые частоты

% Построение графиков
figure;
subplot(2,1,1);
plot(frequencies, amplitude_spectrum);
title('Амплитудный спектр');
xlabel('Частота (Гц)');
ylabel('Амплитуда');

subplot(2,1,2);
stem(frequencies(significant_indices), phase_spectrum(significant_indices), 'r');
title('Фазовый спектр (значимые частоты)');
xlabel('Частота (Гц)');
ylabel('Фаза (радианы)');