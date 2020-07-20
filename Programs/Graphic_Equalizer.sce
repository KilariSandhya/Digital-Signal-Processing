clc;clear;close;
Fs=44.1*10^3;
[music,Fs,bits]=wavread("m01ah.wav");
X=abs(fft(music));
bass=500;
vocal=1.5*10^3;
treb=20*10^3;
bar([bass vocal treb ]);
xtitle('equalizer','no of bands','frequency');
