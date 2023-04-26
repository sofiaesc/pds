clf; clc; clear all;

%----------------------------------%
%-------------INCISO A-------------%
figure(1)

% conjunto de señales variando la frecuencia:
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

% coeficientes:
c_a=[1 8 6 1 2 15 1 12 1 1];
% combinación lineal:
y_a = c_a(1)*y1_a + c_a(2)*y2_a + c_a(3)*y3_a + c_a(4)*y4_a + c_a(5)*y5_a + c_a(6)*y6_a + c_a(7)*y7_a + c_a(8)*y8_a + c_a(9)*y9_a + c_a(10)*y10_a;
subplot(1,2,1)
hold on
grid on
title('Combinación lineal de las senoidales (cambio de frecuencia)')
stem(t,y_a,'m-*','linewidth',1.2)

% productos internos:
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

% conjunto de señales variando la fase:
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

% coeficientes:
c_b=[1 8 6 1 2 15 1 12 1 1];
% combinación lineal:
y_b = c_b(1)*y1_b + c_b(2)*y2_b + c_b(3)*y3_b + c_b(4)*y4_b + c_b(5)*y5_b + c_b(6)*y6_b + c_b(7)*y7_b + c_b(8)*y8_b + c_b(9)*y9_b + c_b(10)*y10_b;
subplot(1,2,1)
hold on
grid on
title('Combinación lineal de las senoidales (cambio de fase)')
stem(t,y_b,'m-*','linewidth',1.2)

% productos internos:
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

% senoidales (descomentar las que voy a comparar)

% con cambio de frecuencia:
%{
[t,y1_c]=senoidal(0,1,50,1,1,0);
[t,y2_c]=senoidal(0,1,50,2,1,0);
[t,y3_c]=senoidal(0,1,50,3,1,0);
[t,y4_c]=senoidal(0,1,50,4,1,0);
[t,y5_c]=senoidal(0,1,50,5,1,0);
[t,y6_c]=senoidal(0,1,50,6,1,0);
[t,y7_c]=senoidal(0,1,50,7,1,0);
[t,y8_c]=senoidal(0,1,50,8,1,0);
[t,y9_c]=senoidal(0,1,50,9,1,0);
[t,y10_c]=senoidal(0,1,50,10,1,0);
%}

% con cambio de fase:
[t,y1_c]=senoidal(0,1,50,1,1,phi(1));
[t,y2_c]=senoidal(0,1,50,1,1,phi(2));
[t,y3_c]=senoidal(0,1,50,1,1,phi(3));
[t,y4_c]=senoidal(0,1,50,1,1,phi(4));
[t,y5_c]=senoidal(0,1,50,1,1,phi(5));
[t,y6_c]=senoidal(0,1,50,1,1,phi(6));
[t,y7_c]=senoidal(0,1,50,1,1,phi(7));
[t,y8_c]=senoidal(0,1,50,1,1,phi(8));
[t,y9_c]=senoidal(0,1,50,1,1,phi(9));
[t,y10_c]=senoidal(0,1,50,1,1,phi(10));

% señal cuadrada:
[t,y_c]=cuadrada(0,1,50,5.5,0);

% productos internos:
v_c = [dot(y_c,y1_c) dot(y_c,y2_c) dot(y_c,y3_c) dot(y_c,y4_c) dot(y_c,y5_c) dot(y_c,y6_c) dot(y_c,y7_c) dot(y_c,y8_c) dot(y_c,y9_c) dot(y_c,y10_c)];
hold on
grid on
title('Productos internos entre señal cuadrada y las senoidales')
bar(v_c,'m')
