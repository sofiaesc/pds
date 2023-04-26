%-------------------------------
%-------TIEMPO E IMPULSO--------
%-------------------------------
t = 1:0.5:10;
size_t = length(t);
x=zeros(1,size_t);
x(1)=1;

%-------------------------------
%-----------SISTEMAS------------
%-------------------------------

%-----------INCISO 1:-----------
y_1 = zeros(1,size_t); % declaro sistema vacío
y_1(1) = x(1);
y_1(2) = x(2);
for n=3:size_t
 y_1(n) = x(n) + y_1(n-2);
endfor

subplot(1,3,1); % GRAFICO
plot(t,y_1);

%-----------INCISO 2-----------
y_2 = zeros(1,size_t); % declaro sistema vacío

y_2(1) = x(1);
for n=2:size_t
  y_2(n) = x(n) + 0.5*x(n-1);
endfor

subplot(1,3,2); % GRAFICO
plot(t,y_2);


%-----------INCISO 3:-----------
y_3 = zeros(1,size_t); % declaro sistema vacío

y_3(1) = x(1);
y_3(2) = x(2) + 0.5*y_3(1);
for n=3:size_t
  y_3(n) = x(n) + 0.5*x(n-1) - 0.25*y_3(n-2);
endfor

subplot(1,3,3); % GRAFICO
plot(t,y_3);
