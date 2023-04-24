% DATOS:
fm = 100;
tini = 0;
tfin = 1;
fs = 3;
A = 1;
phi = 0;

% SENOIDAL:
[t,y]=senoidal(tini,tfin,fm,fs,A,phi);
plot(t,y,'r-')
hold on

% SYNC:
[t,y] = sync(tini,tfin,fm,fs);
plot(t,y,'g-')

% CUADRADA:
[t,y]=cuadrada(tini,tfin,fm,fs,phi);
plot(t,y,'m-')
