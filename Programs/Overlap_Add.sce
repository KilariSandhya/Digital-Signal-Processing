clc;close;clear;
[a,Fs,Bits]=wavread("machali.wav");
fm=3000;
L=100;
t=0.0001:1/Fs:length(a)*1/Fs;
x=sin(2*%pi*fm*t);
NoiseAdded=a+x;
h=[1 -2*cos(2*%pi*fm/Fs) 1];
M=length(h);
k=0;
N=L+M-1;
NoiseWave=NoiseAdded;
for i=1:ceil(length(a)/N)
    for j=1:100
        X(i,j)=NoiseWave(j+k);
     end
     j=j+1;
     X(i,j)=0;
     j=j+1;
     X(i,j)=0;
     k=k+100;
end
 
for i=4:102
    h(i)=0;
end
k=2;
h1=[];
for i=1:length(h)-1
    h1(i)=h(k);
    k=k+1;
end
hn=[];
hn(1)=h(1);
k=2;
for i=length(h1):-1:1
    hn(k)=h1(i);
    k=k+1;
end
h1=hn';
hn=0;
n=102;
hmatrix = [ ];
hmatrix(1,:)=h1;
for i=2:102
     k=h1(1);
    fn=h1(n);
    for l=1:n-1
    t=h1(l+1);
    h1(l+1)=k;
    k=t;
    end
h1(1)=fn;
hmatrix(i,:)=h1;
end
y=X*hmatrix;
k=2;
yfinal = [];
yfinal(1,1) = y(1,1);
for i=1:251
        for j=3:102
        yfinal(1,k)=y(i,j);
        if modulo(k,102)==0 then
            if i+1<=250
            yfinal(1,k-1)=yfinal(1,k-1)+y(i+1,1);
            yfinal(1,k)=yfinal(1,k)+y(i+1,2);
        end
        end
        k=k+1;
        end
end
y=yfinal;
yfinal=0;
wavwrite(NoiseAdded,'SineNoise');
wavwrite(y,'OverLapNoise');
wavwrite(a,'OriginalWave');
figure;
plot(a);  xtitle('Original Wave');
figure;
plot(NoiseAdded); xtitle('Wave with sine noise added');
figure;
plot(y); xtitle('Filtered Wave');