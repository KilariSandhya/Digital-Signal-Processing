clc;clear all;close;
fd=1250;
fs=10000;
r=0.99;
wd=%pi*2*fd/fs;
i=1;
for w=0:0.0001:2*%pi;
Hejw(i)=((cos(2*w)+%i*sin(2*w))+1-(2*cos(wd)*(cos(w)+%i*sin(w))))/((cos(2*w)+%i*sin(2*w))+(r^2)-r*(2*cos(wd)*(cos(w)+%i*sin(w))));
i=i+1;
end
Hmag=20*log(abs(Hejw));
w1=0:0.0001:2*%pi;
w2=w1*10000/(2*%pi);
plot(w2, abs(Hejw)) ;