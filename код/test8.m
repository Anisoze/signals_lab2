% ��������� �������
Fs = 1000;          % ������� �������������, ��
T = 1;              % ������������ �������, �������
t = 0:1/Fs:T-1/Fs;  % ��������� �����
f_signal = 10;      % ������� ���������, ��

% �������������� ������
x = sin(2*pi*f_signal*t);

% �������������� �����
N = length(x);           % ����� �������
X = fft(x);              % ������ FFT
frequencies = (0:N-1)*(Fs/N); % ��������� �����

% ����������� � ������� �������
amplitude_spectrum = abs(X);       % ������ �������
phase_spectrum = angle(X);         % ���� �������

% ����� ��� ������ �������� ������
threshold = max(amplitude_spectrum) * 0.1; % 10% �� ������������ ���������
significant_indices = amplitude_spectrum > threshold; % ������ �������� �������

% ���������� ��������
figure;
subplot(2,1,1);
plot(frequencies, amplitude_spectrum);
title('����������� ������');
xlabel('������� (��)');
ylabel('���������');

subplot(2,1,2);
stem(frequencies(significant_indices), phase_spectrum(significant_indices), 'r');
title('������� ������ (�������� �������)');
xlabel('������� (��)');
ylabel('���� (�������)');