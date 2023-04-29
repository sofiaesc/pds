clc; clear all; clf;

%---------------------------%
%-----------DATOS-----------%
%---------------------------%

% SEÑAL SENOIDAL:
tini = 0;
tfin = 1;
fm = 100;
fs = 5;
A = 1;
phi = 0;
[t,seno]=senoidal(tini,tfin,fm,fs,A,phi);
N = length(seno);

% DELTA DE DIRAC:
dirac = zeros(1,N);
dirac(1) = 1;

% CALCULO DFT DE AMBAS:
dft_seno = dft(seno);
dft_dirac = dft(dirac);

% GRAFICO:
figure(1)
subplot(2,2,1)
hold on; grid on;
title('Señal senoidal')
stem(t,seno,'m')

subplot(2,2,3)
hold on; grid on;
title('Delta de Dirac')
stem(t,dirac,'m')

f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);

subplot(2,2,2)
hold on; grid on;
title('DFT de la señal senoidal')
stem(f,abs(dft_seno),'m')
% Se puede ver como, en el dominio frecuencial, la energía de la senoidal se
% concentra en su frecuencia. Se forman picos en f = +- 5.

subplot(2,2,4)
hold on; grid on;
title('DFT del delta de Dirac')
stem(f,abs(dft_dirac),'m')
% Se puede observar como, en el dominio frecuencial, la energía del delta de
% Dirac está distribuida en todas las frecuencias.

%---------------------------%
%---------VENTANAS----------%
%---------------------------%

figure(2)

% VENTANA CUADRADA:
w_ini = 1; % inicio de intervalo arbitrario
w_fin = round(N/2); % fin de intervalo arbitrario
w_square = zeros(1,N);
w_square(w_ini:w_fin) = 1;
subplot(3,2,1)
hold on; grid on;
title('Ventana cuadrada')
stem(t,w_square,'m')

dft_w_square = dft(w_square);
subplot(3,2,2)
hold on; grid on;
title('Respuesta en frecuencia')
plot(f,abs(dft_w_square),'m')

% VENTANA DE HAMMING:
w_hamming = hamming(N);
subplot(3,2,3)
hold on; grid on;
title('Ventana de Hamming')
stem(t,w_hamming,'m')

dft_w_hamming = dft(w_hamming);
subplot(3,2,4)
hold on; grid on;
title('Respuesta en frecuencia')
plot(f,20*log10(abs(dft_w_hamming)),'m')
axis([-60 60 -100,10])

% VENTANA DE BLACKMAN:
w_blackman = blackman(N);
subplot(3,2,5)
hold on; grid on;
title('Ventana de Blackman')
stem(t,w_blackman,'m')

dft_w_blackman = dft(w_blackman)
subplot(3,2,6)
hold on; grid on;
title('Respuesta en frecuencia')
plot(f,20*log10(abs(dft_w_blackman)),'m')
axis([-60 60 -100,10])

% Como conclusión de las gráficas, la ventana cuadrada tiene como
% particularidad el fenómeno de alias. Esto se debe a que hay una
% discontinuidad en el borde del intervalo de frecuencias de interés.

% Para las ventanas de Hamming y Blackman tomamos el log10 de sus
% magnitudes para poder analizar la respuesta en frecuencia en
% escala logarítmica en vez de lineal, así resaltar las componentes
% espectrales que tienen una amplitud muy pequeña en comparación con
% la amplitud de la componente principal. Tras analizarlas, se vio
% que las ventanas de Blackman y de Hamming producen respuestas en
% frecuencia muy similares, reduciendo el fenómeno de alias que
% presenta la cuadrada. En particular, Hamming hace un cambio más
% suave entre las frecuencias de interés y las otras, mientras que
% Blackman transiciona de manera más brusca.
