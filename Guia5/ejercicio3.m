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
% Sin embargo, si elimino los polos y ceros que coinciden, el
% polo problematico se va y obtengo un sistema estable.

%---------------------------------
%-----------INCISO B--------------

x = zeros(1,20); % impulso:
x(1) = 1;
t = 1:length(x); % tiempo

A = [1 -0.7 0.1];
B = [1 -1 1];
y = filter(B,A,x); % sacando los polos y ceros que coinciden: estable, converge a cero.

A2 = [1 -1.7 0.7 -0.1];
B2 = [1 -2 2 -1];
y2 = filter(B2,A2,x); % sin sacar los polos y ceros que coinciden: inestable, diverge.

figure(2)
subplot(2,1,1)
stem(t,y,'m')
title('Sacando polos y ceros que coinciden')
subplot(2,1,2)
stem(t,y2,'m')
title('Sin sacar polos y ceros que coinciden')

%--------------------------------------------------------------------------------
% HAY TRES POSIBILIDADES EN EL EJERCICIO B:
% Como primera opcion, tengo que pasar a negativo de nuevo las z
% y despues hago toda la operacion inversa hasta llegar al LTI
% con el LTI, evaluo y saco la respuesta al impulso.
% respuesta al impulso se evalua con condiciones iniciales 0,
% si le pongo otra estoy asumiendo que habia algo antes del sistema.
% quiero ver como responde solo al impulso.

% Tambien puedo hacer antitransformada de Z pero no "podemos" por integral dificil.

% Sino paso de H(z) a H(k) y despues hago antitransformada de Fourier,
% pero no es valido si el sistema es de respuesta infinita IIR (para FIR si anda).
% Para ser valido, tendria que poder ser capaz de calcular una h(n) infinita,
% sino me va a dar una aproximación que puede ser re mala.
