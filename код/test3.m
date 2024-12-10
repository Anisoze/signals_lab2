%filterbuilder
%fvtool(Hhp2);
[a, b]=tf(Hhp2);

% Установка частоты дискретизации 
Fs=1000; % Частота дискретизации (Гц) 

% Создание временного вектора 
X=0:1/Fs:10-1/Fs; % Вектор времени от 0 до 10 секунд с шагом 1/Fs 

% Генерация синусоидального сигнала 
Y=sin(2*pi*10*X); % Синусоида с частотой 10 Гц 

% Построение графика чистой синусоиды 
subplot(3,1,1); % Создание первой из трех областей для графиков (Рисунок 1)
plot(X,Y); % Построение синусоиды
grid; % Включение сетки
title('Синусоида'); % Заголовок графика
xlabel('Время, с'); % Подпись оси X
ylabel('Значение'); % Подпись оси Y
xlim([0 1.5]); % Установка границ оси X
ylim([-1 1]); % Установка границ оси Y


% Создание шума
noise=0.1*sin(2*pi*X);

% Построение графика синусоиды с добавленным шумом 
subplot(3,1,2); % График во второй области
Y_n=Y+noise; % Добавление шума
plot(X,Y_n); % График синусоиды с шумом
grid; % Включение сетки
title('Синусоида с шумом'); % Заголовок графика
xlabel('Время, с'); % Подпись оси X
ylabel('Значение'); % Подпись оси Y
xlim([0 1.5]); % Установка границ оси X
ylim([-1.1 1.1]); % Установка границ оси Y
%ylim([-100.1 100.1]);

 
subplot(3,1,3); % График в третьей области
Y_f=filter(a,b,Y_n); % Пропускаем зашумленный сигнал через фильтр Hhp
plot(X,Y_f); % График отфильтрованного сигнала
grid; % Включение сетки
title('Синусоида после фильтрации'); % Заголовок графика
xlabel('Время, с'); % Подпись оси X
ylabel('Значение'); % Подпись оси Y
xlim([0 1.5]); % Установка границ оси X
ylim([-1 1]); % Установка границ оси Y
pause;


% Частотный анализ чистой синусоиды 
subplot(3,1,1); % Возвращение к первой области графиков 
W=fft(Y); % Быстрое преобразование Фурье синусоиды 
n=length(Y); % Длина сигнала
fshift=(-n/2:n/2-1)*(Fs/n); % Создание вектора частот
wshift=fftshift(W); % Сдвиг нуля частоты в центр спектра
wshift=wshift*2/length(W); % Масштабирование спектра 
stem(fshift,abs(wshift)); % Построение амплитудного спектра 
grid; % Включение сетки
title('Амплитудный спектр синусоиды'); % Заголовок графика 
xlabel('Частота, Гц'); % Подпись оси X 
ylabel('Амплитуда'); % Подпись оси Y
xlim([0 13]); % Установка границ оси X
ylim([0 1.1]); % Установка границ оси Y


subplot(3,1,2); % Переход ко второй области графиков 
W=fft(Y_n); % Быстрое преобразование Фурье синусоиды 
fshift=(-n/2:n/2-1)*(Fs/n); % Создание вектора частот
wshift=fftshift(W); % Сдвиг нуля частоты в центр спектра
wshift=wshift*2/length(W); % Масштабирование спектра 
stem(fshift,abs(wshift)); % Построение амплитудного спектра
grid; % Включение сетки
title('Амплитудный спектр синусоиды с шумом'); % Заголовок графика 
xlabel('Частота, Гц'); % Подпись оси X 
ylabel('Амплитуда'); % Подпись оси Y
xlim([0 13]); % Установка границ оси X
ylim([0 1.1]); % Установка границ оси Y

subplot(3,1,3); %Переход к третьей области графиков 
W=fft(Y_f); % Быстрое преобразование Фурье синусоиды 
fshift=(-n/2:n/2-1)*(Fs/n); % Создание вектора частот
wshift=fftshift(W); % Сдвиг нуля частоты в центр спектра
wshift=wshift*2/length(W); % Масштабирование спектра 
stem(fshift,abs(wshift)); % Построение амплитудного спектра
grid; % Включение сетки
title('Амплитудный спектр синусоиды после фильтра'); % Заголовок графика
xlabel('Частота, Гц'); % Подпись оси X 
ylabel('Амплитуда'); % Подпись оси Y
xlim([0 13]); % Установка границ оси X
ylim([0 1.1]); % Установка границ оси Y
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
%plot(fshift,angle(wshift));
grid;
title('Фазовый спектр синусоиды');
xlabel('Частота, Гц');
ylabel('Фаза');
xlim([0 15]);
ylim([-2 2]);


subplot(3,1,2);
W=fft(Y_n);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % Модуль спектра
phase_spectrum = angle(wshift);         % Фаза спектра
threshold = max(amplitude_spectrum) * 0.1; % 10% от максимальной амплитуды
significant_indices = amplitude_spectrum > threshold; % Только значимые частоты
stem(fshift(significant_indices), phase_spectrum(significant_indices));
%plot(fshift,angle(wshift));
grid;
title('Фазовый спектр синусоиды с шумом');
xlabel('Частота, Гц');
ylabel('Фаза');
xlim([0 15]);
ylim([-2 2]);

subplot(3,1,3);
W=fft(Y_f);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % Модуль спектра
phase_spectrum = angle(wshift);         % Фаза спектра
threshold = max(amplitude_spectrum) * 0.1; % 10% от максимальной амплитуды
significant_indices = amplitude_spectrum > threshold; % Только значимые частоты
stem(fshift(significant_indices), phase_spectrum(significant_indices));
%plot(fshift,angle(wshift));
grid;
title('Фазовый спектр синусоиды после фильтра');
xlabel('Частота, Гц');
ylabel('Фаза');
xlim([0 15]);
ylim([-2 2]);