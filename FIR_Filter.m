%% Universidade Estadual do Maranhão
% Centro de Ciências Tecnológicas
% Curso de Engenharia da Computação
% Processamento Digital de Sinais

% Script filtro FIR

close all; clear; clc;

%Leitura do arquivo de audio com ruido
[signal, freq] = audioread();
signal = signal * 2;

%Criacao do filtro
freq_cut = 2000; %frequencia de corte em hertz
freq_reject = 3000; %frequencia de rejeicao em hertz
attenuation_freq_cut = 3; %Passband ripple in dB
attenuation_freq_reject = 50; %Stopband ripple in dB
lowpass_filter = fdesign.lowpass('Fp,Fst,Ap,Ast',freq_cut,freq_reject,attenuation_freq_cut,attenuation_freq_reject,freq);
fir_filter = design(lowpass_filter,'FIR');
disp('Filtro FIR: ');
measure(fir_filter)
fir_order = lenght(fir_filter.Numerator);
disp(['Ordem minima: ',num2str(fir_order)]);

% Filtragem do sinal
fir_signal = filter(fir_filter,signal);
