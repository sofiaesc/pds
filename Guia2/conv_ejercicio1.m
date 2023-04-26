clear all; clf; clc;
figure(1)
hold on
grid on

% SEÑALES:
x=[1 2 0.5 4];
h=[0 1 3 0.5];

% CONVOLUCIÓN LINEAL DE OCTAVE:
conv_lineal_octave = conv(x,h);
stem(conv_lineal_octave,'y','linewidth',2)


% FUNCIÓN PROPIA DE CONVOLUCIÓN LINEAL:
conv_lineal_yo = convolucionlineal(x,h);
hold on
stem(conv_lineal_yo,'b--','linewidth',2)
legend('Funcion propia')

% FUNCIÓN FILTER:
% A(1) * y(n) = B(1)*x(n) + B(2)*x(n-1) + ... - A(2)*y(n-1) - ...
% En la convolución lineal de mis señales de 4 elementos, tengo:
% y(n) = h(n)*x(1) + h(n-1)*x(2) + h(n-2)*x(3) + h(n-3)*x(4)
% y(1) = h(1)*x(1)
% y(2) = h(2)*x(1) + h(1)*x(2)
% y(3) = h(3)*x(1) + h(2)*x(2) + h(1)*x(3)
% y(4) = h(4)*x(1) + h(3)*x(2) + h(2)*x(3) + h(1)*x(4)
% !! notar que me faltan y(5:7)

% Luego, mi vector A deberá ser [1 0 0 0 ..] porque no tengo salidas anteriores.
A=zeros(1,length(x));
A(1) = 1;
% Mi vector B deberá ser la h con la que convolucioné.
B = h;

y = filter(B,A,x);
plot(y,'r-*','linewidth',1.5)
% me devuelve solo los primeros 4 valores porque llega hasta el tamaño de x.

x = [1 2 0.5 4 0 0 0];
y = filter(B,A,x);
plot(y,'g-','linewidth',0.7)
% si quiero que me haga toda la convolución, tengo que redefinir x con el tamaño
% deseado, esto es, x + h - 1, y llenar los espacios nuevos con ceros.

legend('Funcion Octave','Funcion propia','Funcion filter','Funcion filter 2','location','northwest')
