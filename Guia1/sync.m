function [t,y] = sync(tini,tfin,fm,fs)
  T=1/fm; # periodo = 1/frecuencia
  t=tini:T:tfin-T; # intervalo de tiempo
  x=2*pi*fs*t; # obtengo mi x
  for i=1:length(x) # aplico a cada punto de esa x
    if(x(i)==0)
      y(i)=1; # seteo en 1
    else
      y(i)=sin(x(i))/x(i); # aplico definición
    endif
  endfor
 end
