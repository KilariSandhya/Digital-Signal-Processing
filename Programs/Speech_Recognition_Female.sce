clear;close;clc;
[y_female,Fs,bits]=wavread("Female.wav");
//playsnd(y,Fs);//Fs=8000Hz(While recording)
figure(1);
plot2d(y_female);
xtitle('Female Voice');
y_female_extracted=y_female(1,5229:6316);
//playsnd(Y_extracted,Fs);
//plot2d(Y_extracted);
y_female_extracted_final=y_female_extracted(1,1:Fs*0.03);//Playing 30ms of uttarnce
//playsnd(y_female_extracted_final,Fs);
t=0:1/8000:0.029875;
figure(2);
plot2d(t,y_female_extracted_final);
xtitle('Female Voice Extracted');
n=1:512;
y_female_extracted_app=[y_female_extracted_final zeros(1:512-length(y_female_extracted_final))];
//Zero padding to make it eligible for 512 point DFT
Y_female_extracted_final=20*log10(fft(y_female_extracted_app,-1));
figure(3);
plot2d(Fs*n(1:256)/512,Y_female_extracted_final(1:256));
xtitle('Female Voice Extracted DFT','Frequency in Hz','Gain in db');
