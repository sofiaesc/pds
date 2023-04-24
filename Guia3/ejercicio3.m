% Coeficientes calculados en el ejemplo:
v=[0 sqrt(3/2) 0 -sqrt(7/32)];
rms(v)

% Con pequeñas variaciones en los coeficientes:
v_2=v+0.5;
rms(v_2)

% Con más coeficientes:
v_3=zeros(10);

rms(v_3)
