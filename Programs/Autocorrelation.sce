clc;clear;close;
wavread("ibat.wav","size")
[y,Fs,bits]=wavread("ibat.wav");
figure;
//plot(y(1,:));
xtitle('Vowel a');
xlabel('bits');
ylabel('recorded signal');
y=wavread("ibat.wav")
plot(y(1,:));
yconj=conj(y);
l=length(y);
N=2*l-1;
y=[y zeros(1,N-l)];
yconj=[yconj zeros(1,N-l)];
for lag=1:N;
    R(lag)=0;
    for i=1:N
        if(i>=lag)
        h(i)=yconj(i-lag+1)*y(i);
        R(lag)=R(lag)+h(i);
        end
    end
end
k=-l+1:l-1
figure;
plot2d(k,R);
xtitle('Auto correlation');
xlabel('lag values');
ylabel('autocorrelation');

    
