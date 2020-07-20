clear;close;clc;
[y_male,Fs,bits]=wavread("Male.wav");
//playsnd(y,Fs);//Fs=8000Hz(While recording)
figure(1);
plot2d(y_male);
xtitle('male Voice');
y_male_extracted=y_male(1,10000:11233);
//playsnd(Y_extracted,Fs);
//plot2d(Y_extracted);
y_male_extracted_final=y_male_extracted(1,1:Fs*0.03);//Playing 30ms of uttarnce
//playsnd(y_male_extracted_final,Fs);
t=0:1/8000:0.029875;
figure(2);
plot2d(t,y_male_extracted_final);
xtitle('Male Voice Extracted');
n=1:512;
y_male_extracted_app=[y_male_extracted_final zeros(1:512-length(y_male_extracted_final))];
//Zero padding to make it eligible for 512 point DFT
Y_male_extracted_final=20*log10(fft(y_male_extracted_app,-1));
figure(3);
plot2d(Fs*n(1:256)/512,Y_male_extracted_final(1:256));
xtitle('Male Voice Extracted DFT','Frequency in Hz','Gain in db');
