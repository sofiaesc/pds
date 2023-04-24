function [t,y]=senoidal(tini,tfin,fm,fs,A,phi)
  T=1/fm;
  t=tini:T:tfin-T;
  y=A*sin(2*pi*fs*t+phi);
end
