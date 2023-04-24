clc; clf; clear all;

% t:0:Tm:0.1-Tm;
% Período de muestreo Tm = 0.00125. De (0.03,0.04] tengo 8 muestras. Luego, Tm=0.01/8=0.00125
% Frecuencia de muestreo: fm = 1/Tm = 1/0.0125 = 80.
% Amplitud A = 3. Gráficamente, veo la distancia desde el eje x hasta las crestas/valles.
% Frecuencia fs = 20. Obtengo el período de la onda, T = Tm*40 gráficamente, luego T=0.05 y fs=1/T.
% Retardo temporal t1=0,00625: Efectúa el primer cruce con el x=0 cuando t=0,00625.
% Fase phi = -2*pi*fs*t1 = -0.078539

Tm=0.00125;
t=0:Tm:0.1-Tm;
A=3;
fs=20;
t1=0.00625;
phi=-2*pi*fs*t1;
y=A*sin(2*pi*fs*t+phi); % en la consigna faltaba el *t
stem(t,y)

