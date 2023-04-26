clear all; clf; clc;

% SEÑALES
h=[1 2 2 0];
x=[2 1 0.5 0];
t=[0 1 2 3];

% CONVOLUCIÓN CIRCULAR DE OCTAVE
pkg load signal
N=length(x);
conv_circular_octave = cconv(x,h,N);
plot(t,conv_circular_octave,'y','linewidth',2)

% FUNCIÓN PROPIA DE CONVOLUCIÓN CIRCULAR
conv_circular_yo = convolucioncircular(x,h);
hold on
plot(t,conv_circular_yo,'b--','linewidth',2)
