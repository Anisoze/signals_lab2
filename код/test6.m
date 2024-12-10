aIIR=[-0.0140; 0.0382; -0.0307; -0.0106; 0.0277; -0.0117];
bIIR=[0; 4.4667; -8.1240; 7.5078; -3.5219; 0.6704]; %����� ��������, ������ 1 ������� 0
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


N=length(aIIR);
Y_f=zeros(1,length(X));
Y_f=IIR_First_N(N, Y_n, Y_f, aIIR, bIIR);
Y_f=IIR_filter(N, Y_n, Y_f, aIIR, bIIR);
%Y_f=(Y_f/2.8)+1;




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

