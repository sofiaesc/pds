clear all; clf; clc;
% Ejercicio 1:

%-----------------------------------
%--------------ENTRADA--------------
%-----------------------------------
n=0:0.5:10
x=ones(1,length(n));

%-----------------------------------
%-------------SEÑALES---------------
%-----------------------------------

% ------------INCISO A--------------
% y[n] = g[n]x[n], g[n] = A.sin(wnT), w=2*pi*f
A=1;
fs=2;
fm=10;
T=1/fm;
ya=A*sin(2*pi*fs*n*T).*x;

% No lineal
% No tiene memoria: Salida no depende de entradas anteriores.
% Causal: Salida sólo depende de entradas anteriores y actuales.
% Variante: Coeficientes de la ecuación no son constantes.

subplot(2,2,1)
stem(n,ya,'m')

% ------------INCISO B--------------
% y[n] = sum(x[k]) para k=n-n0:n+n0
n0 = 2; % el máximo de esta señal es 2*n0 + 1
nx = length(x);
yb = zeros(1,nx);
for i = 1:nx
  for k = i-n0:i+n0
    if (k >= 1 && k <= nx)
      yb(i) += x(k);
    endif;
  endfor
endfor

% Lineal: Cumple con homogeneidad y superposición.
% Tiene memoria: Salida depende de entradas anteriores n-n0.
% No causal: Salida depende de entradas posteriores n+n0.
% Invariante: Coeficientes de la ecuación son constantes.

subplot(2,2,2)
stem(n,yb,'m')

% ------------INCISO C--------------
% y[n] = x[n] + 2
yc=x+2;

% No lineal: A continuación se demuestra que no cumple con superposición.
%            x1[n] = 5 -> y1[n] = 7       x2[n] = 3 -> y2[n] = 5.
%            x1[n]+x2[n] = 8 -> y[n] = 10  ---->  Como se tiene que
%            y1[n]+y2[n] = 12              ---->  10 != 12, no cumple.
% No tiene memoria: Salida no depende de entradas anteriores.
% Causal: Salida sólo depende de entradas anteriores y actuales.
% Invariante: Coeficientes de la ecuación son constantes.

subplot(2,2,3)
stem(n,yc,'m')

% ------------INCISO D--------------
% y[n] = nx[n]
yd=n.*x;

% Lineal: Cumple con homogeneidad y superposición.
% No tiene memoria: Salida no depende de entradas anteriores.
% Causal: Salida sólo depende de entradas anteriores y actuales.
% Variante: Coeficientes de la ecuación no son constantes.

subplot(2,2,4)
stem(n,yd,'m')
