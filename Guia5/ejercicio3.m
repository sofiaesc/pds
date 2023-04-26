%---------------------------------
%-----------INCISO A--------------
% Grafico teniendo en cuenta que el eje x es el eje real y el eje y es el imaginario.
% Luego, defino los puntos p = (partereal, parteimaginaria)

% CEROS:
c1 = [1 0]; % borde del circulo unitario y coincide con un polo
c2 = [1/2 sqrt(3)/2]; % borde del circulo unitario
c3 = [1/2 -sqrt(3)/2]; % borde del circulo unitario

% POLOS:
p1 = [1 0]; % borde del circulo unitario y coincide con un polo
p2 = [0.5 0];
p3 = [0.2 0];

% GRAFICA:
figure(1)
hold on
grid on
axis([-2 2 -2 2]);
t = linspace(0,2*pi,100)';
plot(cos(t),sin(t),'m');

plot(c1(1),c1(2),'bo')
plot(c2(1),c2(2),'bo')
plot(c3(1),c3(2),'bo')
plot(p1(1),p1(2),'rx')
plot(p2(1),p2(2),'rx')
plot(p3(1),p3(2),'rx')

% En conclusión, no es estable porque hay un polo que no está
% dentro del circulo unitario sino en el borde del mismo.

%---------------------------------
%-----------INCISO B--------------

% impulso:
x = zeros(1,10);
x(1) = 1;

% tiempo:
t = 0:9;

% señal:
y = zeros(1,10);

y(1) = x(1);
%y(2) = 1.7*y(i-1) + x(i) - 2*x(i-1);
%y(3) = 1.7*y(i-1) -0.8*y(i-2) + x(i) - 2*x(i-1) + 2*x(i-2);
y(2) = 0.7*y(1) + x(2) - x(1);
y(3) = 0.7*y(2) - 0.1*y(1) + x(3) - x(2) + x(1);

for i=4:10
  %y(i) = 1.7*y(i-1) -0.8*y(i-2) + 0.1*y(i-3) + x(i) - 2*x(i-1) + 2*x(i-2) - x(i-3); % sin sacar los polos y ceros que coinciden
  y(i) = 0.7*y(i-1) - 0.1*y(i-2) + x(i) - x(i-1) + x(i-2);
endfor

figure(2)
stem(t,y,'m')

%--------------------------------------------------------------------------------
% HAY TRES POSIBILIDADES EN EL EJERCICIO B:
% Como primera opcion, tengo que pasar a negativo de nuevo las z
% y despues hago toda la operacion inversa hasta llegar al LTI
% con el LTI, evaluo y saco la respuesta al impulso.
% respuesta al impulso se evalua con condiciones iniciales 0,
% si le pongo otra estoy asumiendo que habia algo antes del sistema.
% quiero ver como responde solo al impulso.

% Tambien puedo hacer antitransformada de Z pero no puedo por integral dificil.

% Sino paso de H(z) a H(k) y despues hago antitransformada de Fourier,
% pero no es valido si el sistema es de respuesta infinita IIR (para FIR si anda).
% Para ser valido, tendria que poder ser capaz de calcular una h(n) infinita.
% Sino me va a dar una aproximación que puede ser re mala.
