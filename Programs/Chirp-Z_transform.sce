clc;clear;close;
N=512; //DFT length
f1=2000; //first frequency
f2=2060; //second frequency
fs=10000; //sampling frequency
t=0:(1/fs):0.01;
x1=sin(2*%pi*f1*t);
x2=sin(2*%pi*f2*t);
x=x1+x2;
l=length(x);
x=[x zeros(1,N-l)]; //x(n)
X=fft(x);
mag=abs(X);
for n=0:N-1
a=.95^-(n+1); //r^-n
y(n+1)=x(n+1)*a; //x(n) . r^-n
end
Y=fft(y);
mag1=abs(Y);
fx=(0:length(X)-1)'*fs/length(X);
fy=(0:length(Y)-1)'*fs/length(Y);
subplot(211),plot2d3(fx,mag);
xlabel('frequency'),ylabel('magnitude');title('DFT');
subplot(212),plot2d3(fy,mag1);
xlabel('frequency'),ylabel('magnitude');title('ZFT');
