clc;clear;close;
fm1=697;
fs=8000;
N=320;
t=0:1/fs:0.04;
wn1=2.*%pi.*fm1;
x1=cos(wn1*t);
fm2=1209;
wn2=2.*%pi.*fm2;
x2=cos(wn2.*t);
x=x1+x2;
X=fft(x);
magX=abs(X);
figure(1);k=0:length(x)-1;
f_hz=k.*fs/(length(X));
subplot(211);plot2d(t,x);
subplot(212);plot2d(f_hz,magX);
sound(x,fs);
wavwrite(x,fs,'dtfm.wav');
savewave('dtfm.wav',x);
f=[697,770,852,941,1209,1336,1477,1633];
R1=round(N*f/fs);
R=ceil(R1);
