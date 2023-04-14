clc; clf; clear all;

# DATOS:
A=1;
fs=4000;
fm=129;
T=1/fm;
t=0:T:2-T;
phi=0;

# SEÑAL:
y=A*sin(2*pi*fs*t+phi);
plot(t,y)

# Periodo de la onda es 1, frecuencia también será 1.
# Si varío la frecuencia de muestreo en una unidad, se deforma todo.
# Como la frecuencia de muestreo es mucho más chica que la frecuencia
# de la señal, no cumple el teorema del muestreo que dice la frecuencia
# de muestreo debe ser el doble o más de la frecuencia de la señal.
# Lo que se puede observar es el fenómeno de alias debido a no cumplir con
# este teorema y, en este caso especial, el alias conicide con la forma de
# una senoidal de frecuencia de señal 1, amplitud 1, ángulo de fase 0.
