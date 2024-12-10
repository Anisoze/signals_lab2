% ��������� ������� ������������� 
Fs=1000; % ������� ������������� (��) 

% �������� ���������� ������� 
X=0:1/Fs:10-1/Fs; % ������ ������� �� 0 �� 10 ������ � ����� 1/Fs 

% ��������� ��������������� ������� 
Y=sin(2*pi*10*X); % ��������� � �������� 10 �� 

% ���������� ��������� 
subplot(3,1,1); % �������� ������ �� ���� �������� ��� �������� (������� 1)
plot(X,Y); % ���������� ���������
grid; % ��������� �����
title('���������'); % ��������� �������
xlabel('�����, �'); % ������� ��� X
ylabel('��������'); % ������� ��� Y
xlim([0 1.5]); % ��������� ������ ��� X
ylim([-1 1]); % ��������� ������ ��� Y


subplot(3,1,2); % �������� ������ ������� ��� �������� 
noise=0.1*sin(2*pi*X); % ��� � ���� ��������� � ���������� 0.1 
plot(X,noise); % ���������� ����
grid; % ��������� �����
title('���'); % ��������� ������� 
xlabel('�����, �'); % ������� ��� X
ylabel('��������'); % ������� ��� Y 
xlim([0 1.5]); % ��������� ������ ��� X 
ylim([-0.1 0.1]); % ��������� ������ ��� Y


subplot(3,1,3); % �������� ������� ������� ��� �������� 
Y_n=Y+noise; % �������� ��������� � ���� 
plot(X,Y_n); % ���������� ������� � ����� 
grid; % ��������� �����
title('��������� � �����'); % ��������� �������
xlabel('�����, �'); % ������� ��� X
ylabel('��������'); % ������� ��� Y 
xlim([0 1.5]); % ��������� ������ ��� X 
ylim([-1.1 1.1]); % ��������� ������ ��� Y 
pause;

% ��������� ������ ��������� 
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

% ��������� ������ ���� 
subplot(3,1,2); % ������� �� ������ ������� �������� 
W=fft(noise); % ������� �������������� ����� ��������� 
fshift=(-n/2:n/2-1)*(Fs/n); % �������� ������� ������
wshift=fftshift(W); % ����� ���� ������� � ����� �������
wshift=wshift*2/length(W); % ��������������� ������� 
stem(fshift,abs(wshift)); % ���������� ������������ �������
grid; % ��������� �����
title('����������� ������ ����'); % ��������� ������� 
xlabel('�������, ��'); % ������� ��� X 
ylabel('���������'); % ������� ��� Y
xlim([0 13]); % ��������� ������ ��� X
ylim([0 1.1]); % ��������� ������ ��� Y

% ��������� ������ ������� � ����� 
subplot(3,1,3); % ������� � ������� ������� �������� 
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