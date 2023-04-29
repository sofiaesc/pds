%{
--- Solución con función de Octave:
b = [1];
a = [1 -0.5 0.25];
[H_freqz,f_freqz] = freqz(b,a,f,fm);
subplot(4,2,2);
plot(f,abs(H_freqz))
title('Respuesta en frecuencia con freqz')
%}

%--------------------------------------%
%----------------DATOS-----------------%
fm = 10000; % frecuencia de muestreo
T = 1/fm; % período de muestreo
N = 512; % número de muestras
f = linspace(-fm/2,fm/2,N); % redistribución de la frecuencia
w = 2*pi*f/fm; % omega
z = exp(j*w); % redefino z = e^(jw)

x = zeros(1,N);
x(1)=1; % impulso

%--------------------------------------%
%--------------INCISO 1----------------%
H = 1./(1 - 1/2*z.^-1 + 1/4*z.^-2);
subplot(2,2,1)
plot(f,abs(H),'m')
title('Respuesta en frecuencia: inciso 1')

%--------------------------------------%
%--------------INCISO 2----------------%
H = (z.^-1)./(1 - z.^-1 - z.^-2);
subplot(2,2,2)
plot(f,abs(H),'m')
title('Respuesta en frecuencia: inciso 2')

%--------------------------------------%
%--------------INCISO 3----------------%
H = 7./(1 - 2*z.^-1 + 6*z.^-2);
subplot(2,2,3)
plot(f,abs(H),'m')
title('Respuesta en frecuencia: inciso 3')

%--------------------------------------%
%--------------INCISO 4----------------%
H = 1 + 2*z.^-1 + 4*z.^-2 + 8*z.^-3 + 16*z.^-4 + 32*z.^-5 + 64*z.^-6 + 128*z.^-7;
subplot(2,2,4)
plot(f,abs(H),'m')
title('Respuesta en frecuencia: inciso 4')
