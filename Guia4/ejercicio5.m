clc; clear all; clf;

%---------------------------%
%-----------DATOS-----------%
%---------------------------%
tini = 0;
tfin = 1;
fm = 50;
fs = 27;
A = 2;
phi = 0;
[t,x]=senoidal(tini,tfin,fm,fs,A,phi);

X = dft(x);
N = length(x)
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);
stem(f,abs(X),'m')

%---------------------------%
%---------INCISO 1----------%
%---------------------------%

% La frecuencia de la señal que se observa es de 23Hz.
% En la guía el intervalo es (1,50) por eso pareciera ser 24Hz.
% En la gráfica de la figura 1 se puede apreciar mejor.
% Esto ocurre debido a que no se cumple el teorema del muestreo.
% Vemos que fm = 50 y fs = 27, lo correcto sería que fm fuera
% mayor o igual a 54 (2*fm). Aparecen frecuencias aparentes,
% esto es, fenómeno de álias.

%---------------------------%
%---------INCISO 2----------%
%---------------------------%

% La ecuación para obtener la frecuencia de la señal con alias es:
% f_alias = abs(fs - fm*round(fs/fm))

% Probamos con la señal anterior:
% f_alias = abs(27 - 50*round(27/50))
% f_alias = abs(27 - 50*1)
% f_alias = abs(-23) = 23

% Probamos con otra señal:
tini = 0;
tfin = 1;
fm = 100;
fs = 105;
A = 1;
phi = 0;
[t,x]=senoidal(tini,tfin,fm,fs,A,phi);

X = dft(x);
N = length(x)
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);
stem(f,abs(X),'m')

% La frecuencia de la señal observada es 5Hz. Verificamos la ecuación:
% f_alias = abs(105 - 100*round(105/100))
% f_alias = abs(105 - 100*round(105/100))
% f_alias = abs(105 - 100*1)
% f_alias = abs(5) = 5
