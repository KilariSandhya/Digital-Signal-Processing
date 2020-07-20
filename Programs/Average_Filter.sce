clear; close; clc; 
t=0.001:1/8000:0.01; 
x=sin(2*%pi*1000*t); 
x1=sin(2*%pi*2000*t); 
x2=sin(2*%pi*3000*t); 
x3=sin(2*%pi*4000*t); 
x4=sin(2*%pi*5000*t); 
x5=sin(2*%pi*6000*t); 
x6=sin(2*%pi*7000*t); 
x7=sin(2*%pi*8000*t); 
S=x+x1+x2+x3+x4+x5+x6+x7; 
b=fft(S); 
N=length(S); 
k=0:length(S)-1; 
f=k*8000/N; 
a=length(S); 
h= [1/3 1/3 1/3]; 
N = a + length(h)-1; 
S1= [S zeros(1:N-length(S))]; 
X=fft(S1); 
h=[h zeros(1:N-length(h))]; 
H=fft(h); 
Y=X.*H; //DFT OF Y 
l1=length(Y); 
k1=0:l1-1; 
f1=k1*8000/l1; 
y=ifft(Y); 
 
h1= [1/5 1/5 1/5 1/5 1/5]; 
N1= a+length(h1)-1; 
S2=[S zeros(1:N1-length(S))]; 
X1=fft(S2); 
h1=[h1 zeros(1:N1-length(h1))]; 
H1=fft(h1); 
Y1=X1.*H1;  
l2=length(Y1); 
k2=0:l2-1; 
f2=k2*8000/l2; 
y1=ifft(Y1); 

figure(1); 
subplot(311),plot2d(t,S),xtitle('INPUT SINE WAVE','time(sec)','sine(t)'); 
subplot(312),plot2d(t,y(1:length(S))),xtitle('OUTPUT AFTER PASSING THROUGH LENGTH 3 FILTER','time(sec)','y(t)'); 
subplot(313),plot2d(t,y1(1:length(S))),xtitle('OUTPUT AFTER PASSING THROUGH LENGTH 5 FILTER','time(sec)','y1(t)'); 

figure(2); 
subplot(311),plot(f,abs(b)),xtitle('INPUT SINE WAVE IN FREQUENCY DOMAIN','f(Hz)','S'); 
subplot(312),plot(f1,abs(Y));xtitle('OUTPUT IN FREQUENCY DOMAIN AFTER PASSING THROUGH LENGTH 3 FILTER', 'f(Hz)','Y'); 
subplot(313),plot(f2,abs(Y1));xtitle('OUTPUT IN FREQUENCY DOMAIN AFTER PASSING THROUGH LENGTH 5 FILTER', 'f(Hz)','Y1')