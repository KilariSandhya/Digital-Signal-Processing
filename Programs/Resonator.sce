clc;clear;close;
f0=1000;//resonate frequency
fs=8000;//sampling frequnecy
freqp=1024;
r=.99;
b0=1;
w0=2*%pi*f0/fs;//convert to randiance
z=%z;
h=b0/(1-2*r*cos(w0)*z^(-1)+r*r*z^(-2));//conjugate zeros and complex poles
[hp,fr]=frmag(h,freqp);//magnitute of fir filter
w=0:2*%pi/(freqp-1):2*%pi;//values of w
plot(w,hp),xtitle('resonator','w_in radians','magnitude');
