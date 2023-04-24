clc; clf; clear all;

%EJERCICIO 4:
fs=5;
phi=0;
A=1;
tini=0;
tfin=2;

%INCISO A: Se corresponde a una onda de 5Hz.
fm=100;
figure(1)
[t,y1]=senoidal(tini,tfin,fm,fs,A,phi)
plot(t,y1)

%INCISO B: Se corresponde a una onda de 5Hz.
fm=25;
figure(2)
[t,y2]=senoidal(tini,tfin,fm,fs,A,phi)
plot(t,y2)

% El siguiente inciso se encuentra en el límite de la condición
% del teorema del muestreo, entonces se ve mal.
%INCISO C:
fm=10;
figure(3)
[t,y3]=senoidal(tini,tfin,fm,fs,A,phi)
plot(t,y3)

% Las siguientes cantidades de ciclos son muy pequeñas en
% relación a la frecuencia y por eso empiezan a verse mal.
% Ver que se debe cumplir que 2fs <= fm. Esto es, fm >= 10.

%INCISO D:
fm=4;
figure(4)
[t,y4]=senoidal(tini,tfin,fm,fs,A,phi)
plot(t,y4)

%INCISO E:
fm=1;
figure(5)
[t,y5]=senoidal(tini,tfin,fm,fs,A,phi)
plot(t,y5)

%INCISO F:
fm=0.5;
figure(6)
[t,y6]=senoidal(tini,tfin,fm,fs,A,phi)
plot(t,y6)
