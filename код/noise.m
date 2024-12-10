Fs=1000;
X=0:1/Fs:10-1/Fs;
N=10;
nums=zeros(1,N);
noise=zeros(1,length(X));
tmp=0;
for i=1:N
    nums(i)=(rand-0.5)*0.2;
    delta=(nums(i)-tmp)/1000;
    for j=1:1000
        noise((i-1)*1000+j)=tmp+delta*j;  
    end
    tmp=nums(i);
end
    
plot(X,noise);
grid;
title('Шум');
xlabel('Время, с');
ylabel('Значение');
xlim('auto');
ylim('auto');
pause;