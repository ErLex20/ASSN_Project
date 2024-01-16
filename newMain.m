clc
clear
close all

%% System

syms x1 x2 x3 l

f = [0; 0; 0];
g1 = [cos(x3); sin(x3); 0];
g2 = [-l*sin(x3); +l*cos(x3); 1];
y1 = x1;
y2 = x2;
h = [y1, y2];
g = [g1, g2];
relativeVectorDegree = [2, 2]; 

%% Signal analysis

signal = out.simout;
fft_signal = fft(signal);

fs = 1000; % Frequenza di campionamento in Hz
t = 0:1/fs:1; % Vettore del tempo da 0 a 1 secondo con passo di campionamento 1/fs
N = length(signal);
frequencies = linspace(0, fs, N); % Frequenze corrispondenti ai bin della trasformata di Fourier


figure(1)
plot(frequencies(1:N/2), fft_signal(1:N/2));
xlabel('Frequenza (Hz)');
ylabel('Amplitude');
title('Spettro del Segnale');
grid on;

[~, index] = max(fft_signal(1:N/2));
dominant_frequency = frequencies(index);
fprintf('Frequenza dominante nel segnale: %.2f Hz\n', dominant_frequency);

%% Filter

% Frequenza di taglio desiderata
f_c = 2.69; % Hz

% Calcola il polo per il filtro passa basso
s_pole = -2 * pi * f_c * 1i;

% Crea la funzione di trasferimento del filtro passa basso
numerator = 1;
denominator = [1, s_pole];

% Creazione dell'oggetto di trasferimento
sys = tf(numerator, denominator);

% Risposta in frequenza del filtro passa basso
bode(sys);
