function [t,y]=cuadrada(tini,tfin,fm,fs,phi)
  T=1/fm; # periodo = 1/frecuencia
  t=tini:T:tfin-T; # intervalo de tiempo
  cond=mod(2*pi*fs*t+phi,2*pi); # condición para comparar
                                # mod da resto de la división: x - y .* floor (x ./ y)
  for i=1:length(cond)
    if(cond(i)>=pi)
      y(i)=-1
    else
      y(i)=1
    endif
  endfor

