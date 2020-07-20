clc;close;clear;
[x,Fs,bits]=wavread("machali.wav");
Fs=8000; 
bits=16
fm=3000 //freq of noise signal given
t=0.0001:1/Fs:length(x)*1/Fs;
xn=sin(2*%pi*fm*t);
y=x+xn;
h=[1 -2*cos(2*%pi*(3000/Fs)) 1];  //impulse response of filter
//overlap and save method
//getting values of x1,x2,x3.....
i=1; j=1;
r(1,1)=0;
r(1,2)=0;
j=3;
for n=1:length(x)
    if modulo(n,98) == 0 then
        r(i,j)=y(n);
        j=1;
        i=i+1;
        r(i,j)=y(n-1);
        j=j+1;
        r(i,j)=y(n);
        j=3;
    else
        r(i,j)=y(n);
        j=j+1;
    end
end
h=[h  zeros(1,(100-length(h)))];
N=100;
N1=length(x);
N2=length(h);
for i=1:386
    for n=0:N-1
        y1(n+1)=0
        for k=0:(N-1)
            n_minus_k_modN=modulo(n-k,N);
            if n_minus_k_modN<0
                n_minus_k_modN=n_minus_k_modN+N;
            end
            if((n_minus_k_modN>=0)&(n_minus_k_modN<N))
                y1(n+1)=y1(n+1)+r(i,k+1)*h(n_minus_k_modN+1);
            end
        end
    end
    for j=1:100
        z(i,j)=y1(j)
    end
end

n=1;
for i=1:386
    for j=3:98
        a(n)=z(i,j);
        n=n+1;
    end
end
figure;
subplot(311);plot2d(y);
subplot(312);plot2d(a);
subplot(313);plot2d(x);