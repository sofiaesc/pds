clc; clear all;

%----------------------------%
%------------DATOS-----------%
%----------------------------%

% GENERACIÓN DE SEÑALES:
tini = 0;
tfin = 1;
fm = 100;
phi = 0;
A = 1;

% Señal a):
[t,a]=senoidal(tini,tfin,fm,2,A,phi);

% Señal b):
[t,b]=cuadrada(tini,tfin,fm,2,phi);

% Señal c):
[t,c]=senoidal(tini,tfin,fm,4,A,phi);
[t,c2]=senoidal(tini,tfin,fm,3.5,A,phi);

%----------------------------%
%----------INCISO A----------%
%----------------------------%

pi_ab = dot(a,b) % no ortogonales
pi_ac = dot(a,c) % ortogonales
pi_bc = dot(b,c) % ortogonales

%----------------------------%
%----------INCISO B----------%
%----------------------------%

% Obtengo DFT de las señales:
dft_a = dft(a);
dft_b = dft(b);
dft_c = dft(c);
% Obtengo magnitudes de estas DFT:
mag_dft_a = abs(dft_a);
mag_dft_b = abs(dft_b);
mag_dft_c = abs(dft_c);
% Comparo las magnitudes:
pi_dft_ab = dot(mag_dft_a,mag_dft_b) % no ortogonales
pi_dft_ac = dot(mag_dft_a,mag_dft_c) % ortogonales
pi_dft_bc = dot(mag_dft_b,mag_dft_c) % ortogonales

% Se puede concluir que se mantienen las ortogonalidades
% al cambiar el espacio. *ver bien por qué para explicarlo*

%----------------------------%
%----------INCISO C----------%
%----------------------------%

% Obtengo DFT y magnitud para nueva señal:
dft_c2 = dft(c2);
mag_dft_c2 = abs(dft(c2));

% Comparo ambos dominios:
pi_ac2 = dot(a,c2) % ortogonales
pi_dft_ac2 = dot(mag_dft_a,mag_dft_c2) % no ortogonales

% Para ver por qué no se mantiene la ortogonalidad, graficamos
% ambas señales y sus respectivos espectros de Fourier.
% Se puede observar que la DFT de la señal c2 tiene el fenómeno
% de alias. Aparecen frecuencias aparentes entre ambos picos
% y eso contribuye a disminuir el parecido entre las señales
% en este dominio.

% Grafico ambas DFT:
N = length(c2);
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1); % Divido en -f/2:f/2 para graficar

figure(1)
subplot(2,1,1)
hold on
grid on
title('Señal a')
plot(t,a)
subplot(2,1,2)
hold on
grid on
title('Espectro de Fourier de a')
stem(t,mag_dft_a)

figure(2)
subplot(2,1,1)
hold on
grid on
title('Señal c (3.5Hz)')
plot(t,c2)
subplot(2,1,2)
hold on
grid on
title('Espectro de Fourier de c (3.5Hz)')
stem(t,mag_dft_c2)

