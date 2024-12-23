aFIR=[-0.0057; -0.0286; -0.0313; -0.0200; -0.0176; -0.0051; 0.0125; 0.0356; 0.0617; 0.0880; 0.1114; 0.1290; 0.1384; 0.1384; 0.1290; 0.1114; 0.0880; 0.0617; 0.0356; 0.0125; -0.0051; -0.0176; -0.0200; -0.0313; -0.0286; -0.0057];

Fs=1000;
X=0:1/Fs:10-1/Fs;
Y=sin(2*pi*10*X);
subplot(3,1,1);
plot(X,Y);
grid;
title('���������');
xlabel('�����, �');
ylabel('��������');
xlim([0 1]);
ylim([-1.65 1.65]);


noise=0.5*sin(2*pi*100*X);


subplot(3,1,2);
Y_n=Y+noise;
plot(X,Y_n);
grid;
title('��������� � �����');
xlabel('�����, �');
ylabel('��������');
xlim([0 1]);
ylim([-1.65 1.65]);

N=length(aFIR);
Y_f=zeros(1,length(X));
Y_f=FIR_First_N(N, Y_n, Y_f, aFIR);
Y_f=FIR_filter(N, Y_n, Y_f, aFIR);


subplot(3,1,3);
plot(X,Y_f);
grid;
title('��������� ����� ����������');
xlabel('�����, �');
ylabel('��������');
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
title('����������� ������ ���������');
xlabel('�������, ��');
ylabel('���������');
xlim([0 105]);
ylim([0 1.1]);


subplot(3,1,2);
W=fft(Y_n);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
stem(fshift,abs(wshift));
grid;
title('����������� ������ ��������� � �����');
xlabel('�������, ��');
ylabel('���������');
xlim([0 105]);
ylim([0 1.1]);

subplot(3,1,3);
W=fft(Y_f);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
stem(fshift,abs(wshift));
grid;
title('����������� ������ ��������� ����� �������');
xlabel('�������, ��');
ylabel('���������');
xlim([0 105]);
ylim([0 1.1]);
pause;



subplot(3,1,1);
W=fft(Y);
n=length(Y);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % ������ �������
phase_spectrum = angle(wshift);         % ���� �������
threshold = max(amplitude_spectrum) * 0.1; % 10% �� ������������ ���������
significant_indices = amplitude_spectrum > threshold; % ������ �������� �������

stem(fshift(significant_indices), phase_spectrum(significant_indices));
%plot(fshift,angle(wshift));
grid;
title('������� ������ ���������');
xlabel('�������, ��');
ylabel('����');
xlim([0 105]);
ylim([-3.2 3.2]);


subplot(3,1,2);
W=fft(Y_n);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % ������ �������
phase_spectrum = angle(wshift);         % ���� �������
threshold = max(amplitude_spectrum) * 0.1; % 10% �� ������������ ���������
significant_indices = amplitude_spectrum > threshold; % ������ �������� �������

stem(fshift(significant_indices), phase_spectrum(significant_indices));
%plot(fshift,angle(wshift));
grid;
title('������� ������ ��������� � �����');
xlabel('�������, ��');
ylabel('����');
xlim([0 105]);
ylim([-3.2 3.2]);

subplot(3,1,3);
W=fft(Y_f);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
amplitude_spectrum = abs(wshift);       % ������ �������
phase_spectrum = angle(wshift);         % ���� �������
threshold = max(amplitude_spectrum) * 0.1; % 10% �� ������������ ���������
significant_indices = amplitude_spectrum > threshold; % ������ �������� �������

stem(fshift(significant_indices), phase_spectrum(significant_indices));
%plot(fshift,angle(wshift));
grid;
title('������� ������ ��������� ����� �������');
xlabel('�������, ��');
ylabel('����');
xlim([0 105]);
ylim([-3.2 3.2]);
