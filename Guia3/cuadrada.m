function [t,y]=cuadrada(tini,tfin,fm,fs,phi)
  T=1/fm;
  t=tini:T:tfin-T;
  cond=mod(2*pi*fs*t+phi,2*phi);
  for i=1:length(cond)
    if(cond(i)>=pi)
      y(i)=-1;
    else
      y(i)=1;
    endif
  endfor

