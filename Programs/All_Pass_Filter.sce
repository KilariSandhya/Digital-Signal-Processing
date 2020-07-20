clc;clear;close;
freqp=30;
a=0.75;//filter coefficient
z=%z;
h=(a+z)/(1+a*z);//transfer function of all pass filter
[hp,fr]=frmag(h,freqp);//magnitude response
w=0:%pi/(freqp-1):%pi;
plot2d3(w,hp);xtitle('all_pass','radians','attenuation');
