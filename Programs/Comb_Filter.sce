clc;clear;close;
fs=500;//sampling frequency
fd=50;
M=10;//number of notches
k=1:M;
fn=fd*k;
z=%z;
h=(1-z^(-2*M))//(1-.99^M*z^(-2*M));//system function 
[hz,fr]=frmag(h,fs);//magnitude response
f=1:fs;
plot(f,hz);xtitle('comb filter','frequency_hz','magnitude');
