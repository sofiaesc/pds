clc; clear all; clf;

%---------------------------%
%-----------DATOS-----------%
%---------------------------%
figure(1)

tini = 0;
tfin = 1;
fm = 50;
fs = 27;
A = 2;
phi = 0;
[t,x]=senoidal(tini,tfin,fm,fs,A,phi);
subplot(1,2,1)
plot(t,x)

X = dft(x);
N = length(x);
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);
subplot(1,2,2)
stem(f,abs(X)/N*2,'m')

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
figure(2)

% La ecuación para obtener la frecuencia de la señal con alias es:
% fo = abs(fs - fm*round(fs/fm)), para lo cual realizamos una función.
% Probamos con la señal anterior:
frec23Hz = frec_obs(fs,fm)

% Probamos con otra señal:
tini = 0;
tfin = 1;
fm = 50;
fs = 105;
A = 1;
phi = 0;
[t,x]=senoidal(tini,tfin,fm,fs,A,phi);

X = dft(x);
N = length(x);
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);
subplot(1,2,1)
stem(f,abs(X),'m')
subplot(1,2,2)

% La frecuencia de la señal observada con fm = 100Hz es 5Hz.
% Verificamos la ecuación:
frec5Hz = frec_obs(fs,fm)

% Probando con otros valores de fm, por ejemplo, fm = 40Hz:
fm = 40;
[t,x]=senoidal(tini,tfin,fm,fs,A,phi);

X = dft(x);
N = length(x);
f = (0:N-1) / N;
nf = length(f);
f = (-nf/2:nf/2-1);
subplot(1,2,2)
stem(f,abs(X),'m')

% La frecuencia de la señal observada con fm = 40Hz es 15Hz.
% Verificamos la ecuación:
frec15Hz = frec_obs(fs,fm)

%---------------------------%
%---------INCISO 2----------%
%---------------------------%

%{
    Para una señal senoidal:
    x[n] = A * sin(2pif*n/N)

    Si obtenemos su DFT:
    X[k] = (A/2) * (exp(-j2pifn/N) - exp(j2pifn/N))*(N/2) = -jA*N/2

    Luego la magnitud de la señal resultante en la frecuencia f es:
    |X[k]| = |j*A*N/2| = A*N/2

    En conclusión:
    A_espectro = A_señal * N / 2;
%}

