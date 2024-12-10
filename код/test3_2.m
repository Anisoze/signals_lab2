%filterbuilder
%fvtool(Hhp2);
[a, b]=tf(Hhp);

Fs=1000;
X=0:1/Fs:10-1/Fs;
Y=sin(2*pi*10*X);
subplot(3,1,1);
plot(X,Y);
grid;
title('���������');
xlabel('�����, �');
ylabel('��������');
xlim([0 1.5]);
%ylim([-101 101]);
ylim([-1.2 1.2]);


noise=100*sin(2*pi*X);


subplot(3,1,2);
Y_n=Y+noise;
plot(X,Y_n);
grid;
title('��������� � �����');
xlabel('�����, �');
ylabel('��������');
xlim([0 1.5]);
ylim([-101 101]);
%ylim([-100.1 100.1]);

subplot(3,1,3);
Y_f=filter(a,b,Y_n);
plot(X,Y_f);
grid;
title('��������� ����� ����������');
xlabel('�����, �');
ylabel('��������');
xlim([0 1.5]);
%ylim([-101 101]);
ylim([-1.5 1.5]);
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
xlim([0 13]);
ylim([0 101]);


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
xlim([0 13]);
ylim([0 101]);

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
xlim([0 13]);
ylim([0 101]);
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
xlim([0 15]);
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
xlim([0 15]);
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
xlim([0 15]);
ylim([-3.2 3.2]);