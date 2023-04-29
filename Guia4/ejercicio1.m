clc; clear all; clf;

%--------------------------------------------%
%------------------INCISO 1------------------%
%--------------------------------------------%

%-------------------SEÑAL--------------------%
% Definir la señal
tini = 0;
tfin = 1;
T = 0.01; % Periodo de muestreo
t = tini:T:tfin-T; % Vector de tiempo
s = sin(2*pi*10*t) + 4*sin(2*pi*20*t); % Señal
N = length(s); % Longitud de la señal

% Graficar la señal
figure(1)
subplot(2, 1, 1);
plot(t, s);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Señal');

%-----------ESPECTRO DE FRECUENCIA-----------%
% Calcular la DFT
S = dft(s);

% Calcular amplitud de la DFT
f = (0:N-1) / N; % Vector de frecuencia (en Hz)
nf = length(f);
f = (-nf/2:nf/2-1); % Divido en -f/2:f/2 para graficar
amplitud = abs(S)/N; % Magnitud del espectro

% Graficar espectro de frecuencia
subplot(2, 1, 2);
stem(f, amplitud);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Espectro de frecuencia');

% Si observamos la gráfica, se ve que hay dos picos. Uno en
% la frecuencia de 10Hz y otro en frecuencia 20Hz. Ver que los
% picos se corresponden con la amplitud de las senoidales:
% El pico de f = 20Hz es más grande que el de f = 10Hz.

%--------------------------------------------%
%------------------INCISO 2------------------%
%--------------------------------------------%
Es_s = sum(s.^2)
Es_S = sum(abs(S).^2)/N
% Ambos dan 850, luego se verifica la relación de Parseval.

%--------------------------------------------%
%------------------INCISO 3------------------%
%--------------------------------------------%

figure(2)

%------------Primera modificación------------%
% En este caso, aparece un pico nuevo en     %
% f = 0Hz. Esto se debe a que se adicionó una%
% constante que tiene frecuencia, luego esto %
% se refleja en el espectro.                 %

s1 = sin(2*pi*10*t) + 4*sin(2*pi*20*t) + 4;
S1 = dft(s1);
amplitud1 = abs(S1)/N;
subplot(2,2,1)
hold on
grid on
stem(f, amplitud);
stem(f, amplitud1);

%------------Segunda modificación------------%
% En este caso, los picos cambian de lugar a %
% las frecuencias de ambos senos: se mantiene%
% f = 10Hz y el pico de f = 20Hz pasa a estar%
% en f = 11Hz. Como no cambié la amplitud de %
% las señales, se mantiene la proporción.    %                         %

s2 = sin(2*pi*10*t) + 4*sin(2*pi*11*t);
S2 = dft(s2);
amplitud2 = abs(S2)/N;
subplot(2,2,2)
hold on
grid on
stem(f, amplitud);
stem(f, amplitud2);

%------------Tercera modificación------------%
% En este caso, los picos cambian de lugar a %
% las frecuencias de ambos senos: se mantiene%
% f = 10Hz y el pico de f = 20Hz pasa a estar%
% en f = 10.5Hz. Como las frecuencias están  %
% muy cerca entre sí, la proporción de los   %
% picos ya no es como en la señal original,  %
% sino que están mucho más cerca los picos   %
% y esto es porque hay una mezcla del aporte %
% de ambas senoidales. Además aparecen unas  %
% magnitudes bajas en el centro del espectro %
% por el fenómeno de álias.                  %

s3 = sin(2*pi*10*t) + 4*sin(2*pi*10.5*t);
S3 = dft(s3);
amplitud3 = abs(S3)/N;
subplot(2,2,3)
hold on
grid on
stem(f, amplitud);
stem(f, amplitud3);

%-------------Cuarta modificación------------%
% En este caso, se obtiene el mismo resultado%
% Aumentar el intervalo de tiempo manteniendo%
% el mismo periodo de muestreo aumenta el    %
% número de muestras, pudiendo contribuir a  %
% la disminución del fenómeno de alias en    %
% ciertos casos.                             %

subplot(2,2,4)
hold on
stem(f,amplitud,'linewidth',2)

tini4 = 0;
tfin4 = 2;
t4 = tini:T:tfin-T;
s4 = sin(2*pi*10*t4) + 4*sin(2*pi*20*t4);
N4 = length(s);
S4 = dft(s);
f4 = (0:N-1) / N4;
nf4 = length(f4);
f4 = (-nf4/2:nf4/2-1); % Divido en -f/2:f/2 para graficar
amplitud4 = abs(S) / N4; % Magnitud del espectro
stem(f4, amplitud4,'linewidth',1);
