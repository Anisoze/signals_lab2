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


subplot(3,1,2);
noise=0.5*sin(2*pi*100*X);
plot(X,noise);
grid;
title('���');
xlabel('�����, �');
ylabel('��������');
xlim([0 1]);
ylim([-1.65 1.65]);


subplot(3,1,3);
Y_n=Y+noise;
plot(X,Y_n);
grid;
title('��������� � �����');
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
title('��� ���������');
xlabel('�������, ��');
ylabel('���������');
xlim([0 105]);
ylim([0 1.1]);

subplot(3,1,2);
W=fft(noise);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
stem(fshift,abs(wshift));
grid;
title('��� ����');
xlabel('�������, ��');
ylabel('���������');
xlim([0 105]);
ylim([0 1.1]);

subplot(3,1,3);
W=fft(Y_n);
fshift=(-n/2:n/2-1)*(Fs/n);
wshift=fftshift(W);
wshift=wshift*2/length(W);
stem(fshift,abs(wshift));
grid;
title('��� ��������� � �����');
xlabel('�������, ��');
ylabel('���������');
xlim([0 105]);
ylim([0 1.1]);