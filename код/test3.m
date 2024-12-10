%filterbuilder
%fvtool(Hhp2);
[a, b]=tf(Hhp2);

% ��������� ������� ������������� 
Fs=1000; % ������� ������������� (��) 

% �������� ���������� ������� 
X=0:1/Fs:10-1/Fs; % ������ ������� �� 0 �� 10 ������ � ����� 1/Fs 

% ��������� ��������������� ������� 
Y=sin(2*pi*10*X); % ��������� � �������� 10 �� 

% ���������� ������� ������ ��������� 
subplot(3,1,1); % �������� ������ �� ���� �������� ��� �������� (������� 1)
plot(X,Y); % ���������� ���������
grid; % ��������� �����
title('���������'); % ��������� �������
xlabel('�����, �'); % ������� ��� X
ylabel('��������'); % ������� ��� Y
xlim([0 1.5]); % ��������� ������ ��� X
ylim([-1 1]); % ��������� ������ ��� Y


% �������� ����
noise=0.1*sin(2*pi*X);

% ���������� ������� ��������� � ����������� ����� 
subplot(3,1,2); % ������ �� ������ �������
Y_n=Y+noise; % ���������� ����
plot(X,Y_n); % ������ ��������� � �����
grid; % ��������� �����
title('��������� � �����'); % ��������� �������
xlabel('�����, �'); % ������� ��� X
ylabel('��������'); % ������� ��� Y
xlim([0 1.5]); % ��������� ������ ��� X
ylim([-1.1 1.1]); % ��������� ������ ��� Y
%ylim([-100.1 100.1]);

 
subplot(3,1,3); % ������ � ������� �������
Y_f=filter(a,b,Y_n); % ���������� ����������� ������ ����� ������ Hhp
plot(X,Y_f); % ������ ���������������� �������
grid; % ��������� �����
title('��������� ����� ����������'); % ��������� �������
xlabel('�����, �'); % ������� ��� X
ylabel('��������'); % ������� ��� Y
xlim([0 1.5]); % ��������� ������ ��� X
ylim([-1 1]); % ��������� ������ ��� Y
pause;


% ��������� ������ ������ ��������� 
subplot(3,1,1); % ����������� � ������ ������� �������� 
W=fft(Y); % ������� �������������� ����� ��������� 
n=length(Y); % ����� �������
fshift=(-n/2:n/2-1)*(Fs/n); % �������� ������� ������
wshift=fftshift(W); % ����� ���� ������� � ����� �������
wshift=wshift*2/length(W); % ��������������� ������� 
stem(fshift,abs(wshift)); % ���������� ������������ ������� 
grid; % ��������� �����
title('����������� ������ ���������'); % ��������� ������� 
xlabel('�������, ��'); % ������� ��� X 
ylabel('���������'); % ������� ��� Y
xlim([0 13]); % ��������� ������ ��� X
ylim([0 1.1]); % ��������� ������ ��� Y


subplot(3,1,2); % ������� �� ������ ������� �������� 
W=fft(Y_n); % ������� �������������� ����� ��������� 
fshift=(-n/2:n/2-1)*(Fs/n); % �������� ������� ������
wshift=fftshift(W); % ����� ���� ������� � ����� �������
wshift=wshift*2/length(W); % ��������������� ������� 
stem(fshift,abs(wshift)); % ���������� ������������ �������
grid; % ��������� �����
title('����������� ������ ��������� � �����'); % ��������� ������� 
xlabel('�������, ��'); % ������� ��� X 
ylabel('���������'); % ������� ��� Y
xlim([0 13]); % ��������� ������ ��� X
ylim([0 1.1]); % ��������� ������ ��� Y

subplot(3,1,3); %������� � ������� ������� �������� 
W=fft(Y_f); % ������� �������������� ����� ��������� 
fshift=(-n/2:n/2-1)*(Fs/n); % �������� ������� ������
wshift=fftshift(W); % ����� ���� ������� � ����� �������
wshift=wshift*2/length(W); % ��������������� ������� 
stem(fshift,abs(wshift)); % ���������� ������������ �������
grid; % ��������� �����
title('����������� ������ ��������� ����� �������'); % ��������� �������
xlabel('�������, ��'); % ������� ��� X 
ylabel('���������'); % ������� ��� Y
xlim([0 13]); % ��������� ������ ��� X
ylim([0 1.1]); % ��������� ������ ��� Y
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
ylim([-2 2]);


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
ylim([-2 2]);

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
ylim([-2 2]);