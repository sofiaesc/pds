clear all; clf; clc;

% DATOS:
a=0.75;
N=5;

% RESPUESTAS AL IMPULSO Y ENTRADA X:
for n=1:N % como octave no tiene indice 0, hago de 1 a N en vez de 0 a N-1.
  hA(n) = sin(8*n);
  hB(n) = a^n;
endfor

% FUNCIÓN DE IMPUSLO UNITARO DELTA Y ENTRADA X:
x=zeros(1,N);
delta=zeros(1,N);
delta(1)=1;
x(1)=delta(1);
for n=2:N
    x(n) = delta(n) - a*delta(n-1);
endfor

% CALCULO LAS SALIDAS:
% Primero hA y despues hB:
conv_x_hA = convolucionlineal(x,hA);
conv_hA_hB = convolucionlineal(conv_x_hA,hB);
% Primero hB y despues hA:
conv_x_hB = convolucionlineal(x,hB);
conv_hB_hA = convolucionlineal(conv_x_hB,hA);

% PLOTEO:
stem(conv_hA_hB,'b-*')
hold on
stem(conv_hB_hA,'y','linewidth',1)
legend('Convolución hA -> hB','Convolución hB -> hA')

% Comparación: obtengo el mismo resultado.
