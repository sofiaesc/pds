clf; clc; clear all;

%----------------------------------%
%-------------INCISO A-------------%
figure(1)

% CONJUNTO DE SEÑALES VARIANDO LA FRECUENCIA:
[t,y1_a]=senoidal(0,1,50,1,1,0);
[t,y2_a]=senoidal(0,1,50,2,1,0);
[t,y3_a]=senoidal(0,1,50,3,1,0);
[t,y4_a]=senoidal(0,1,50,4,1,0);
[t,y5_a]=senoidal(0,1,50,5,1,0);
[t,y6_a]=senoidal(0,1,50,6,1,0);
[t,y7_a]=senoidal(0,1,50,7,1,0);
[t,y8_a]=senoidal(0,1,50,8,1,0);
[t,y9_a]=senoidal(0,1,50,9,1,0);
[t,y10_a]=senoidal(0,1,50,10,1,0);

% COEFICIENTES:
c_a=[1 8 6 1 2 15 1 12 1 1];
% COMBINACIÓN LINEAL:
y_a = c_a(1)*y1_a + c_a(2)*y2_a + c_a(3)*y3_a + c_a(4)*y4_a + c_a(5)*y5_a + c_a(6)*y6_a + c_a(7)*y7_a + c_a(8)*y8_a + c_a(9)*y9_a + c_a(10)*y10_a;
subplot(1,2,1)
hold on
grid on
title('Combinación lineal de las senoidales (cambio de frecuencia)')
stem(t,y_a,'m-*','linewidth',1.2)

% PRODUCTOS INTERNOS:
v_a = [dot(y_a,y1_a) dot(y_a,y2_a) dot(y_a,y3_a) dot(y_a,y4_a) dot(y_a,y5_a) dot(y_a,y6_a) dot(y_a,y7_a) dot(y_a,y8_a) dot(y_a,y9_a) dot(y_a,y10_a)];
subplot(1,2,2)
hold on
grid on
title('Productos internos entre la CL y las senoidales')
bar(v_a,'m')
bar(c_a*10,'b',alpha=0.3) % grafico coeficientes para ver relación.
% En este inciso, hay una relación entre coeficientes de la CL y producto interno.

%----------------------------------%
%-------------INCISO B-------------%
figure(2)

% CONJUNTO DE SEÑALES VARIANDO LA FASE:
phi = linspace(0,2*pi,10); % genero intervalo de 0 a 2*pi, de 10 elementos.
[t,y1_b]=senoidal(0,1,50,1,1,phi(1));
[t,y2_b]=senoidal(0,1,50,1,1,phi(2));
[t,y3_b]=senoidal(0,1,50,1,1,phi(3));
[t,y4_b]=senoidal(0,1,50,1,1,phi(4));
[t,y5_b]=senoidal(0,1,50,1,1,phi(5));
[t,y6_b]=senoidal(0,1,50,1,1,phi(6));
[t,y7_b]=senoidal(0,1,50,1,1,phi(7));
[t,y8_b]=senoidal(0,1,50,1,1,phi(8));
[t,y9_b]=senoidal(0,1,50,1,1,phi(9));
[t,y10_b]=senoidal(0,1,50,1,1,phi(10));

% COEFICIENTES:
c_b=[1 8 6 1 2 15 1 12 1 1];
% COMBINACIÓN LINEAL:
y_b = c_b(1)*y1_b + c_b(2)*y2_b + c_b(3)*y3_b + c_b(4)*y4_b + c_b(5)*y5_b + c_b(6)*y6_b + c_b(7)*y7_b + c_b(8)*y8_b + c_b(9)*y9_b + c_b(10)*y10_b;
subplot(1,2,1)
hold on
grid on
title('Combinación lineal de las senoidales (cambio de fase)')
stem(t,y_b,'m-*','linewidth',1.2)

% PRODUCTOS INTERNOS:
v_b = [dot(y_b,y1_b) dot(y_b,y2_b) dot(y_b,y3_b) dot(y_b,y4_b) dot(y_b,y5_b) dot(y_b,y6_b) dot(y_b,y7_b) dot(y_b,y8_b) dot(y_b,y9_b) dot(y_b,y10_b)];
subplot(1,2,2)
hold on
grid on
title('Productos internos entre la CL y las senoidales')
bar(v_b,'m')
bar(c_b*10,'b',alpha=0.3) % grafico coeficientes para ver relación
% En este inciso, no parece haber una relación entre coeficientes de la CL y producto interno.

%----------------------------------%
%-------------INCISO C-------------%
figure(3)

% SEÑAL CUADRADA:
[t,y_c]=cuadrada(0,1,50,5.5,0);

%----------------------------------%

% SENOIDALES CON CAMBIO DE FRECUENCIA:
[t,y1_c1]=senoidal(0,1,50,1,1,0);
[t,y2_c1]=senoidal(0,1,50,2,1,0);
[t,y3_c1]=senoidal(0,1,50,3,1,0);
[t,y4_c1]=senoidal(0,1,50,4,1,0);
[t,y5_c1]=senoidal(0,1,50,5,1,0);
[t,y6_c1]=senoidal(0,1,50,6,1,0);
[t,y7_c1]=senoidal(0,1,50,7,1,0);
[t,y8_c1]=senoidal(0,1,50,8,1,0);
[t,y9_c1]=senoidal(0,1,50,9,1,0);
[t,y10_c1]=senoidal(0,1,50,10,1,0);

% PRODUCTOS INTERNOS:
v_c1 = [dot(y_c,y1_c1) dot(y_c,y2_c1) dot(y_c,y3_c1) dot(y_c,y4_c1) dot(y_c,y5_c1) dot(y_c,y6_c1) dot(y_c,y7_c1) dot(y_c,y8_c1) dot(y_c,y9_c1) dot(y_c,y10_c1)];
subplot(1,2,1)
hold on
grid on
title('Productos internos entre señal cuadrada y las senoidales (cambio de frecuencia)')
axis([0 11 -6 6])
bar(v_c1,'m')
% Los productos internos son iguales a cero en todos los casos, luego son ortogonales estas señales con la señal cuadrada.
% Si variamos las frecuencias en decimales, aparecen números distintos de cero en la gráfica.

%----------------------------------%

% SENOIDALES CON CAMBIO DE FASE:
[t,y1_c2]=senoidal(0,1,50,1,1,phi(1));
[t,y2_c2]=senoidal(0,1,50,1,1,phi(2));
[t,y3_c2]=senoidal(0,1,50,1,1,phi(3));
[t,y4_c2]=senoidal(0,1,50,1,1,phi(4));
[t,y5_c2]=senoidal(0,1,50,1,1,phi(5));
[t,y6_c2]=senoidal(0,1,50,1,1,phi(6));
[t,y7_c2]=senoidal(0,1,50,1,1,phi(7));
[t,y8_c2]=senoidal(0,1,50,1,1,phi(8));
[t,y9_c2]=senoidal(0,1,50,1,1,phi(9));
[t,y10_c2]=senoidal(0,1,50,1,1,phi(10));

v_c2 = [dot(y_c,y1_c2) dot(y_c,y2_c2) dot(y_c,y3_c2) dot(y_c,y4_c2) dot(y_c,y5_c2) dot(y_c,y6_c2) dot(y_c,y7_c2) dot(y_c,y8_c2) dot(y_c,y9_c2) dot(y_c,y10_c2)];
subplot(1,2,2)
hold on
grid on
title('Productos internos entre señal cuadrada y las senoidales (cambio de fase)')
bar(v_c2,'m')

% Grafico la señal cuadrada junto a las señales con menor y mayor parecido con la misma, esto es, las barras más cortas y las más largas en la figura 3-2:
figure(4)
hold on
grid on
plot(t,y_c)
plot(t,y1_c2)
plot(t,y10_c2)
plot(t,y3_c2)
plot(t,y8_c2)
legend('Cuadrada','phi = 0','phi = 2*pi','phi = 3*pi/5','phi = 8*pi/5')

% Para las senoidales con ángulo de fase phi = 0 y phi = 2*pi, que son iguales porque su diferencia es una vuelta completa a la circunferencia, el producto interno
% con la cuadrada es 0 (o cercano por la tolerancia), indicando que tienen poco parecido. El parecido es máximo para phi = 3*pi/5 y para phi = 8*pi/5.
pi_3 = dot(y_c,y3_c2)
pi_8 = dot(y_c,y8_c2)
% La distancia entre estos dos es de pi, luego el producto punto es el mismo pero uno en positivo y otro en negativo porque, para este ultimo caso, son opuestas.
