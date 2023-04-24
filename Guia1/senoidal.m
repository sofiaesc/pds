function [t,y]=senoidal(tini,tfin,fm,fs,A,phi)
  T=1/fm; % periodo de muestra es 1 sobre la frecuencia de muestreo.
  t=tini:T:tfin-T; % genero mi intervalo de tiempo con los tiempos iniciales y finales, y el período.
  y=A*sin(2*pi*fs*t+phi); % armo mi ecuación con el tiempo obtenido y los argumentos de la función.
end
