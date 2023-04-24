clear all; clf; clc;
% Ejercicio 1:

% Sistema tiene entradas actuales y entradas anteriores, es causal y tiene memoria.
% No es causal si recibe entradas de instantes posteriores pero puede tener memoria.
% DATOS
A=1;
fs=2;
fm=10;
T=1/fm;
n=0:0.05:10
x=sin(4*n);

% a) y[n] = g[n]x[n], g[n] = A.sin(wnT), w=2*pi*f
ya=A*sin(2*pi*fs*n*T).*x;
figure(1)
plot(n,ya)

% b) y[n] = sum(x[k]) para k=n-no:n+no
% Tiene memoria entonces necesito x anteriores y las posteriores
x_ant=sin(1/2*n+2);
x_pos=sin(3*n+1);
yb=x_ant+x+x_pos;
figure(2)
plot(n,yb)

% c) y[n] = x[n] + 2
yc=x+2;
figure(3)
plot(n,yc)

% d) y[n] = nx[n]
yd=n.*x;
figure(4)
plot(n,yd)
