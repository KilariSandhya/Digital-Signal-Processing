clc;clear;close;
[x,fs,byts]=wavread('m01uh.wav');
sound(x,fs);
l=length(x);
disp(l);
r=0.8;
alpha=0.5;
for n=r+1:1:l
    z1(n)=x(n);
    z2(n)=alpha*x(n-r);
    y(n)=z1(n)+z2(n);
end
sound(y,fs);
figure(1);
t1=0:1/fs:(length(z1)-1)/fs;
t2=0:1/fs:(length(z2)-1)/fs;
t3=0:1/fs:(length(y)-1)/fs;
subplot(311);plot(t1,z1);xtitle('original signal','t','x(t)');
subplot(312);plot(t2,z2);xtitle('delayed signal','t','x(t-r)');
subplot(313);plot(t3,y);xtitle('echo signal','t','y(t)');
