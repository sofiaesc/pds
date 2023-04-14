clf; clc; clear all;

# -----------------------------------------------
# ----------------DATOS Y SEÑALES----------------

# SENOIDAL ORGINAL:
tini=0;
tfin=2;
fm=10; # frecuencia de muestreo original
T=1/fm; # periodo de muestreo original
fs=1;
A=1;
phi=0;
[t,x]=senoidal(tini,tfin,fm,fs,A,phi);

# SEÑAL NUEVA:
factor = 4;
fmi=factor*fm; # nueva frecuencia de muestreo
Ti=1/fmi; # nuevo periodo de muestreo
ti=tini:Ti:tfin-Ti; # intervalo de tiempo nuevo

# -----------------------------------------------
# -----------------INTERPOLACIÓN-----------------

m = length(ti); # tamaño tiempo nuevo
n = length(t); # tamaño tiempo original
xi = zeros(1,m); # declaro señal sobremuestreada vacía

for i=1:m
  for j=1:n
      indice = (ti(i) - t(j))/T;

      # INTERPOLADOR SINC:
      #xi(i) += x(j) * interpolador_sinc(0.5,indice);

      # INTERPOLADOR LINEAL:
      #xi(i) += x(j) * interpolador_lineal(indice);

      # INTERPOLADOR ESCALON:
      xi(i) += x(j) * interpolador_escalon(indice);
  endfor
endfor

# -----------------------------------------------
# --------------------PLOTEO---------------------

figure(1)
stem(ti,xi,'r-')
hold on
stem(t,x,'b-')

figure(2)
plot(ti,xi,'r-')
hold on
plot(t,x,'b-')
