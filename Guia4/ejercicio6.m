clc; clf; clear all;

%---------------------------%
%-----------DATOS-----------%
%---------------------------%

s=load("necg.txt"); % cargo señal desde archivo de texto
figure(1)
subplot(2,2,1)
plot(s) % grafico la señal
title('Electrocardiograma (ECG)')

fm = 360; % frecuencia de muestreo
N = length(s); % cantidad de muestras

%---------------------------%
%---------CÁLCULOS----------%
%---------------------------%

% Obtengo la DFT:
S = dft(s);
magS = abs(S);
subplot(2,2,3)

% Grafico:
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);
stem(f,magS)
title('Espectro de Fourier del ECG')

% Para filtrar el ruido con la DFT de la señal, tomo las magnitudes
% del DFT que están comprendidas en el rango afectado por el ruido,
% en este caso (más de 40Hz) y las elimino, esto es, seteo en 0.
% Para eso, hago un filtro o máscara que sea 1 para las frecuencias
% de interés y 0 para la franja con ruido, y lo multiplico por S.

filtro = zeros(1,N);
filtro(find(abs(f) <= 40)) = 1;
S_filtrada = S.*filtro;

% Grafico:

subplot(2,2,4)
stem(f,abs(S_filtrada))
title('Espectro de Fourier del ECG sin ruido')
axis([-600 600 0 50000])

% Obtengo el ECG haciendo la antitransformada de mi nuevo espectro.

s_filtrada = real(idft(S_filtrada));
subplot(2,2,2)
plot(s_filtrada)
title('Electrocardiograma (ECG) sin ruido')

