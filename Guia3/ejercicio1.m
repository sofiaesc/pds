pkg load signal;
clf;

%----------------------------------------------------%
%-------------------SEÑAL SENOIDAL-------------------%
%----------------------------------------------------%

% Obtengo señal:
disp("SENOIDAL")
[t,sino]=senoidal(0,1,100,3,1,0);

% Grafico:
subplot(2,2,1)
stem(t,sino,'m')
title('Senoidal')
xlabel('t')
ylabel('y')

% Datos:
valormedio = mean(sino)
maximo = max(sino)
minimo = min(sino)
amplitud = norm(sino,inf)
energia = norm(sino,2)^2
accion = norm(sino,1)
potenciamedia = rms(sino)^2
raizvcm = rms(sino)

%----------------------------------------------------%
%---------------------SEÑAL RAMPA--------------------%
%----------------------------------------------------%

% Obtengo señal:
disp("\nRAMPA")
t = (-1:0.01:1);
unitstep = t>=0;
ramp = t.*unitstep;

% Grafico:
subplot(2,2,2);
stem(t,ramp,'m')
title('Rampa')
xlabel('t')
ylabel('y')

% Datos:
valormedio = mean(ramp)
maximo = max(ramp)
minimo = min(ramp)
amplitud = norm(ramp,inf)
energia = norm(ramp,2)^2
accion = norm(ramp,1)
potenciamedia = rms(ramp)^2
raizvcm = rms(ramp)

%----------------------------------------------------%
%-------------------SEÑAL CUADRADA-------------------%
%----------------------------------------------------%

% Obtengo señal:
disp("\nCUADRADA")
[t,cuad]=cuadrada(0,1,100,3,0);

% Grafico:
subplot(2,2,3);
stem(t,cuad,'m')
title('Cuadrada')
xlabel('t')
ylabel('y')

% Datos:
valormedio = mean(cuad)
maximo = max(cuad)
minimo = min(cuad)
amplitud = norm(cuad,inf)
energia = norm(cuad,2)^2
accion = norm(cuad,1)
potenciamedia = rms(cuad)^2
raizvcm = rms(cuad)

%----------------------------------------------------%
%------------------SEÑAL ALEATORIA-------------------%
%----------------------------------------------------%

% Obtengo señal:
disp("\nALEATORIA")
aleatoria = rand(1,100);

% Grafico:
subplot(2,2,4);
stem(t,aleatoria,'m')
title('Aleatoria')
xlabel('t')
ylabel('y')

% Datos:
valormedio = mean(aleatoria)
maximo = max(aleatoria)
minimo = min(aleatoria)
amplitud = norm(aleatoria,inf)
energia = norm(aleatoria,2)^2
accion = norm(aleatoria,1)
potenciamedia = rms(aleatoria)^2
raizvcm = rms(aleatoria)

