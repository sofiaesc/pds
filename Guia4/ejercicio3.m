clc; clear all;

% Propiedad de desplazamiento temporal (retardo):
% x[n - i] <---TF---> X[k]e^(-j*2*pi*k*i/N)

%---------------------------%
%-----------DATOS-----------%
%---------------------------%

tini = 0;
tfin = 1;
fm = 100;
fs = 10;
A = 1;
phi = 0;
[t,x]=senoidal(tini,tfin,fm,fs,A,phi);

% agrego ceros para poder identificar si se desplazó bien
% en la gráfica al final del ejercicio.
x = [x zeros(1,20)];
t = linspace(0,1,length(x));

%---------------------------%
%-----------DATOS-----------%
%---------------------------%

% Calculo DFT:
X = dft(x);

% Desplazamiento de la misma:
N = length(X);
i = 10; % retardo de 10 muestras

for k = 1:N
  X_d(k) = X(k) * e^(-j*2*pi*k*i/N);
end

% Antitransformada de la DFT:
x_d = idft(X_d);

%---------------------------%
%----------GRÁFICA----------%
%---------------------------%

figure(1)
subplot(2,1,1)
hold on; grid on;
title('Señal original')
stem(t,x)
subplot(2,1,2)
hold on; grid on;
title('Señal desplazada')
stem(t,x_d)

figure(2)
N = length(X);
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);
subplot(2,1,1)
hold on; grid on;
title('DFT de señal original')
stem(f,abs(X))
subplot(2,1,2)
hold on; grid on;
title('DFT con propiedad de retardo')
stem(f,abs(X_d))
