clear;close;clc;
f0=500;  
fs=8000; 
N=8000;   
k=N*f0/fs; 
w=[-%pi:%pi/25:%pi];
z=exp(-%i*w);
wn=exp(%i*2*%pi*k/N);
hk=1 ./(1-(wn*z));
mag= abs(hk);
f=(fs*w)/(2*%pi);
plot2d(f,mag); xtitle('Magnitude Plot','hz','Magnitude');

