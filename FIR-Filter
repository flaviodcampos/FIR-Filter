clc
clear all

Fs=200e3;
Ts=1/Fs;
dt=0:Ts:5e-3-Ts;

f1=1e3;
f2=20e3;
f3=30e3;

y=5*sin(2*pi*f1*dt)+5*sin(2*pi*f2*dt)+10*sin(2*pi*f3*dt);

%plot(dt,y)% primeira execução

nfft=length(y);
nfft2=2.^nextpow2(nfft);

fy=fft(y,nfft2);
fy=fy(1:nfft2/2);
%fy=fy(1:nfft2); %terceira execução

xfft=Fs.*(0:nfft2/2-1)/nfft2;
%xfft=Fs.*(0:nfft2-1)/nfft2; %terceira execução

%plot(xfft,abs(fy/max(fy))); %segunda execução

cut_off=1.5e3/Fs/2;
order=16; %aumentando para 32 melhora

h=fir1(order,cut_off);

con=conv(y,h);

plot(con); %quarta e última execução