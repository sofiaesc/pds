clf; clear all; clc;

% Para obtener las funciones de transferencia, usamos
% el operador Z y luego aplicamos H[z] = Y(z)/X(z).

%-------------------------------------%
%----------------DATOS----------------%
t = 0:0.1:9;
N = length(t);
x = zeros(1,N);
x(1)=1; % impulso

%-------------------------------------%
%--------------INCISO 1---------------%
% H[z] = 1./(1 - 0.5*z.^-1 + 0.25*z.^-2)
% H[z] = (z.^2)./(z.^2 - 0.5*z + 0.25)

A = [1 1/2 1/4];
B = [1 0 0];
y_1 = filter(B,A,x);
subplot(2,2,1)
stem(t,y_1)
title('Sistema del inciso 1')
grid on

%-------------------------------------%
%--------------INCISO 2---------------%
% H[z] = (z.^-1)./(1 - z.^-1 - z.^-2)
% H[z] = z./(z^2 - z - 1)

A = [1 -1 -1];
B = [0 1 0];
y_2 = filter(B,A,x);
subplot(2,2,2)
stem(t,y_2)
title('Sistema del inciso 2')
grid on

%-------------------------------------%
%--------------INCISO 3---------------%
% H[z] = 7./(1 - 2*z.^-1 + 6*z^-2)
% H[z] = 7*z.^2./(z.^2 - 2*z + 6)

A = [1 -2 6];
B = [7 0 0];
y_3 = filter(B,A,x);
subplot(2,2,3)
stem(t,y_3)
title('Sistema del inciso 3')
grid on

%-------------------------------------%
%--------------INCISO 4---------------%
% H[z] = 1 + 2*z.^-1 + 4*z.^-2 + 8*z.^-3 + 16*z.^-4 + 32*z.^-5 + 64*z^-6 + 128*z.^-7
% H[z] = z.^7 + 2*z.^6 + 4*z.^5 + 8*z.^4 + 16*z.^3 + 32*z.^2 + 64*z + 128

A = [1 0 0 0 0 0 0];
B = [0 1/2 1/4 1/8 1/16 1/32 1/64 1/128];
y_4 = filter(B,A,x);
subplot(2,2,4)
stem(t,y_4)
title('Sistema del inciso 4')
grid on

