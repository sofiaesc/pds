clear all; clf; clc;

% SEÑALES:
x=[1 2 0.5 4];
h=[0 1 3 0.5];

% CONVOLUCIÓN LINEAL DE OCTAVE:
conv_lineal_octave = conv(x,h);
plot(conv_lineal_octave,'y','linewidth',1.5)

% FUNCIÓN PROPIA DE CONVOLUCIÓN LINEAL:
conv_lineal_yo = convolucionlineal(x,h);
hold on
plot(conv_lineal_yo,'b--','linewidth',1.5)

% FUNCIÓN FILTER:
% Conseguir A y B !!!!!!!!!!!!!!
A=[1 0 0 0];
B=h;
y = filter(B,A,x);
plot(y,'m-*','linewidth',1.5)


