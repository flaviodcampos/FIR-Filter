%% Universidade Estadual do Maranhão
% Centro de Ciências Tecnológicas
% Curso de Engenharia da Computação
% Processamento Digital de Sinais

%% Script filtro FIR

close all; clear; clc;

%Leitura do arquivo de audio com ruido

[signal, freq] = audioread('NoisySpeech-16-22p5-mono-5secs.wav');
signal = signal * 2;

%Criacao do filtro
freq_cut = 2000; %frequencia de corte em hertz
freq_reject = 3000; %frequencia de rejeicao em hertz
attenuation_freq_cut = 3; %Passband ripple in dB
attenuation_freq_reject = 100; %Stopband ripple in dB
lowpass_filter = fdesign.lowpass('Fp,Fst,Ap,Ast',freq_cut,freq_reject,attenuation_freq_cut,attenuation_freq_reject,freq);
fir_filter = design(lowpass_filter,'FIR');
disp('Filtro FIR: ');
measure(fir_filter)
fir_order = length(fir_filter.Numerator);
disp(['Ordem minima: ',num2str(fir_order)]);

% Filtragem do sinal
fir_signal = filter(fir_filter,signal);

%% Resultados

figure('name', 'Sinal no tempo');
time = (1:length(signal))./freq;
fir_time = (1:length(fir_signal))./freq;
subplot(2,1,1);
plot(time, signal);
ylabel('Volume');
xlabel('Tempo (segundos)');
title('Sinal Original');
subplot(2,1,2);
plot(fir_time,fir_signal);
ylabel('Volume');
xlabel('Tempo (segundos)');
title(['Sinal filtrado com filtro FIR de ordem ',num2str(fir_order)]);

%Analise de Espectro

FTSignalAnalysis = fvtool(signal,1,fir_signal,1,'Fs',freq);
legend(FTSignalAnalysis,'Original','Com filtro FIR');
title('Espectro do sinal de audio');

%Analise do filtro
FTFilterAnalysis = fvtool(fir_filter,'Fs',freq);
legend(FTFilterAnalysis,'Filtro FIR');
title('Espectro do Filtro');

%Reproducao do audio
disp('Reproduzindo audio original');
sound(signal, freq);
pause(5);
disp('Reproduzindo audio com filtro FIR');
sound(fir_signal,freq);

