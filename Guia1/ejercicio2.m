clc; clf; clear all;

# SEÑAL SENOIDAL
[t,y]=senoidal(0,1,100,3,1,0);
plot(t,y,'r-')

# INVERSIÓN:
y_inv=inversion(y);
hold on
#plot(t,y_inv,'b-')

# RECTIFICACIÓN:
y_rect=rectificacion(y);
#plot(t,y_rect,'g-')

# CUANTIZACIÓN EN N NIVELES:
N = 8;
y_cuant=cuantizacion(y,N);
#stem(t,y_cuant,'m-')
