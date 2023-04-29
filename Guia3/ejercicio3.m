clf; clc; clear all;

%Funcion a aproximar
[t,y] = cuadrada(-1,1,100,0.5,0);
T = 1/100;
n = -1:T:1-T;

% ---------------------------- %
% ----------INCISO A:--------- %

% Coeficientes del ejemplo:
c=[0 sqrt(3/2) 0 -sqrt(7/32)];

% Aproximación usando estos coeficientes:
yaprox_a = c(2)*(sqrt(3/2)*n) + c(4)*(sqrt(7/2)*((5/2)*n.^3 - (3/2)*n));

# Calculo del error cuadrático
error_aprox_a = ect(y,yaprox_a)

% ---------------------------- %
% ----------INCISO B:--------- %

#Variaciones de los parámetros
#Tanto el primer parámetro como el segundo varían desde p-1 a p+1 con variaciones de 0.1
% Variaciones a los coeficientes:
v_c2 = [c(2)+5, c(2)+2, 0.2];
v_c4 = [c(4)+5, c(4)+2, 0.2];

matrizerror = zeros(20,20);
for z = c(2)-1:0.1:c(2)+1
  for w = c(4)-1:0.1:c(4)+1
    for  n=-1:T:1-T; # intervalo de tiempo
      yaprox_b(round((n+1)*100+1))= z*(sqrt(3/2)*n) + w*(sqrt(7/2)*((5/2)*n.^3 - (3/2)*n)); #Se crea la señal aproximada
    endfor
    matrizerror(round((z-c(2)+1)*10+1),round((w-c(4)+1)*10+1)) = ect(y,yaprox_b);
  endfor
endfor

% Graficar la matriz de errores
figure(2);
imagesc(matrizerror);
xlabel('z');
ylabel('w');
title('Error');
colorbar;
figure(3);
[X,Y] = meshgrid((45/16)-1:0.1:(45/16)+1, (35/16)-1:0.1:(35/16)+1);
surf(X, Y, matrizerror);
xlabel('z');
ylabel('w');
zlabel('Error');

#Variaciones de los parámetros
#Tanto el primer parámetro como el segundo varían desde p-1 a p+1 con variaciones de 0.1

% ---------------------------- %
% ----------INCISO C:--------- %

% Coeficiente 5 (n=4): 0
# Coeficiente 6 (n=5): sqrt(11/128)
# sqrt(11/128) * sqrt(11/2) = 11/16
# 11/16 * (63/8x^5 − 70/8 x^3 + 15/8*x) = 693/128x^5 − 385/64 x^3 + 165/128*x
# 46/16x -35/16x^3 + 693/128x^5 − 385/64 x^3 + 165/128*x = 693/128x^5 - 525/64x^3 + 533/128x

for  k=-1:T:1-T; # intervalo de tiempo
  yaprox_c(round((k+1)*100+1))=(533/128)*k-(525/64)*k^3+(693/128)*k^5;
endfor

#Calculo de los errores totales en las señales de Legendre con un parámetro más
error_aprox_c = ect(y,yaprox_c) % Verifico que disminuye con un coeficiente más.

#Grafica de comparacion entre la función original, Legendre y un parámetro más
figure(4);
plot(t,y,'linewidth',2); hold on;
plot(t,yaprox_a); hold on;
plot(t,yaprox_c,'linewidth',2); hold on;




