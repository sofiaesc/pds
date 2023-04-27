clc
clear all
f=load("te.txt"); % cargo señal desde archivo de texto

T=1/11025;
t=0:T:length(f)*T-T;
plot(t,f,'m');
hold on;

#Frecuencias para filas de arriba hacia abajo:
[k,v1]=senoidal(0,length(f)*T,11025,697,1,0); % 1 2 3
[k,v2]=senoidal(0,length(f)*T,11025,770,1,0); % 4 5 6
[k,v3]=senoidal(0,length(f)*T,11025,852,1,0); % 7 8 9
[k,v4]=senoidal(0,length(f)*T,11025,941,1,0); % * 0 #

#Frecuencias para columnas de izquierda a derecha:
[k,h1]=senoidal(0,length(f)*T,11025,1209,1,0); % 1 4 7 *
[k,h2]=senoidal(0,length(f)*T,11025,1336,1,0); % 2 5 8 0
[k,h3]=senoidal(0,length(f)*T,11025,1477,1,0); % 3 6 9 #

#Búsqueda de púlsos de cada botón
%(viendo la gráfica, identificamos el medio de cada parte de la señal donde se pulsó un botón)
stem(19500*T,1.75); hold on;
stem(32000*T,1.75); hold on;
stem(41000*T,1.75); hold on;
stem(51000*T,1.75); hold on;
stem(61000*T,1.75); hold on;
stem(72000*T,1.75); hold on;
stem(83000*T,1.75); hold on;

#Declaración de rangos para cada botón
%(1000 muestras, 500 abajo y 500 arriba del valor encontrado antes)
r1=19000:20000;
r2=31500:32500;
r3=40500:41500;
r4=50500:51500;
r5=60500:61500;
r6=71500:72500;
r7=82500:83500;

#Análisis del producto interno entre señal de pulso y señal para filas/columnas para observar parecidos entre las señales
%Para saber qué botón es, identifico, tanto para fila como para columna, qué señal se parece más a la señal del pulso de botón.
disp("--------- Boton 1 ----------")
fila1 = abs(dot(f(r1),v1(r1)))
fila2 = abs(dot(f(r1),v2(r1)))
fila3 = abs(dot(f(r1),v3(r1)))
fila4 = abs(dot(f(r1),v4(r1)))
columna1 = abs(dot(f(r1),h1(r1)))
columna2 = abs(dot(f(r1),h2(r1)))
columna3 = abs(dot(f(r1),h3(r1)))
% Como los valores mayores corresponden a la fila 1 y la columna 2, el botón presionado es el 2.

disp("--------- Boton 2 ----------")
fila1 = abs(dot(f(r2),v1(r2)))
fila2 = abs(dot(f(r2),v2(r2)))
fila3 = abs(dot(f(r2),v3(r2)))
fila4 = abs(dot(f(r2),v4(r2)))
columna1 = abs(dot(f(r2),h1(r2)))
columna2 = abs(dot(f(r2),h2(r2)))
columna3 = abs(dot(f(r2),h3(r2)))
% Como los valores mayores corresponden a la fila 2 y la columna 2, el botón presionado es el 4.

disp("--------- Boton 3 ----------")
fila1 = abs(dot(f(r3),v1(r3)))
fila2 = abs(dot(f(r3),v2(r3)))
fila3 = abs(dot(f(r3),v3(r3)))
fila4 = abs(dot(f(r3),v4(r3)))
columna1 = abs(dot(f(r3),h1(r3)))
columna2 = abs(dot(f(r3),h2(r3)))
columna3 = abs(dot(f(r3),h3(r3)))
% Como los valores mayores corresponden a la fila 1 y la columna 2, el botón presionado es el 2.

disp("--------- Boton 4 ----------")
fila1 = abs(dot(f(r4),v1(r4)))
fila2 = abs(dot(f(r4),v2(r4)))
fila3 = abs(dot(f(r4),v3(r4)))
fila4 = abs(dot(f(r4),v4(r4)))
columna1 = abs(dot(f(r4),h1(r4)))
columna2 = abs(dot(f(r4),h2(r4)))
columna3 = abs(dot(f(r4),h3(r4)))
% Como los valores mayores corresponden a la fila 3 y la columna 2, el botón presionado es el 8.

disp("--------- Boton 5 ----------")
fila1 = abs(dot(f(r5),v1(r5)))
fila2 = abs(dot(f(r5),v2(r5)))
fila3 = abs(dot(f(r5),v3(r5)))
fila4 = abs(dot(f(r5),v4(r5)))
columna1 = abs(dot(f(r5),h1(r5)))
columna2 = abs(dot(f(r5),h2(r5)))
columna3 = abs(dot(f(r5),h3(r5)))
% Como los valores mayores corresponden a la fila 1 y la columna 2, el botón presionado es el 2.

disp("--------- Boton 6 ----------")
fila1 = abs(dot(f(r6),v1(r6)))
fila2 = abs(dot(f(r6),v2(r6)))
fila3 = abs(dot(f(r6),v3(r6)))
fila4 = abs(dot(f(r6),v4(r6)))
columna1 = abs(dot(f(r6),h1(r6)))
columna2 = abs(dot(f(r6),h2(r6)))
columna3 = abs(dot(f(r6),h3(r6)))
% Como los valores mayores corresponden a la fila 2 y la columna 3, el botón presionado es el 6.

disp("--------- Boton 7 ----------")
fila1 = abs(dot(f(r7),v1(r7)))
fila2 = abs(dot(f(r7),v2(r7)))
fila3 = abs(dot(f(r7),v3(r7)))
fila4 = abs(dot(f(r7),v4(r7)))
columna1 = abs(dot(f(r7),h1(r7)))
columna2 = abs(dot(f(r7),h2(r7)))
columna3 = abs(dot(f(r7),h3(r7)))
% Como los valores mayores corresponden a la fila 2 y la columna 2, el botón presionado es el 5.
