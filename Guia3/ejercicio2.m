%------------------------------------------------
%-------------------SEÑALES----------------------

% SENOIDAL 1:
fs = 6;
A = 1;
phi = 0;
[t,x]=senoidal(0,1,100,fs,A,phi);

% SENOIDAL 2:
fs = 6;
A = 1;
phi = pi/2;
[t,y]=senoidal(0,1,100,fs,A,phi);

% GRAFICO AMBAS SEÑALES:
clf
plot(t,x,'m')
hold on
plot(t,y,'b')

% REALIZO PRODUCTO INTERNO DE AMBAS:
p_i = dot(x,y)
maximo = norm(x,2)*norm(y,2)

%------------------------------------------------
%----------------CONCLUSIONES--------------------

%{
----> VARIAR LA AMPLITUD:
 Variar la amplitud va a cambiar el máximo del producto interno. A mayor
 amplitud de las señales, hay un incremento en el producto interno. Si
 disminuyo la amplitud de una o de las dos, disminuye el producto interno.
 Poner una amplitud negativa y una positiva implica invertir el rango de
 la señal y resulta en un producto interno negativo porque son opuestas
 en relación al eje x.

----> VARIAR LA FRECUENCIA:
 Afecta el parecido de las señales. Si empezamos en la misma frecuencia para
 ambas señales y variamos la frecuencia de una en decimales, vemos como va
 bajando el producto interno hasta acercarse a cero.
 Cuando la variación entre ambas es 1 o más, ya se hace cero.

----> VARIAR EL ÁNGULO DE FASE:
 Recordando que el producto interno es norm(a,2)*norm(b,2)*cos(a,b), y asumiendo n = 0,1,2...
 Si phi = 0 + 2*pi*n, el producto interno va a ser máximo porque cos(0) = 1.
 Si phi = pi + 2*pi*n, el producto interno va a ser negativo porque son opuestas y cos(n*pi) = -1.
 Si phi = pi/2 * 2*pi*n o phi = 3*pi/2 + 2*pi*n, las señales van a ser ortogonales y el producto interno va a ser 0.
%}
