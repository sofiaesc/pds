% Dado un sistema continuo, obtener un sistema discreto que se comporte igual.
% Sirve para poder tratarlo en la computadora.
% Tengo la H(s), tengo que transformarla en H(z), encontrar la ecuación en dif.
% y hacer lo que se me cante con eso.

% Para obtener H(z) que se comporte lo más parecido a la H(s), tengo que:
% Si reemplazo s = ln(z)/t (mapeo ideal) no quedo en z sino en logaritmo de z.
% Entonces uso mapeos aproximados (tengo que ver qué tan aproximadas son, cuándo
% funcionan y cuando no, TENER CUIDADO).

%--------------------------------------%
%----------------DATOS-----------------%

N = 500; % número de muestras
w = 0:1:N; % rango de muestras
f = w/2*pi; % vector de frecuencias

% Respuesta del sistema continuo:
s = j*w; % redefino mi s
H = @(s) 12500*s / (44*s.^2 + 60625*s + 625*10^4);
figure(1)
hold on
plot(f,H(s))

% Frecuencia de corte:
w_c = sqrt(60625/(2*44));
fm = 4*w_c/2*pi; % se pide que fm sea cuatro veces superior a la frecuencia de corte.
T = 1/fm; % periodo de muestreo

%--------------------------------------%
%-----------TRANSFORMACIONES-----------%

omega = 0:pi/N:pi;
z = e.^(j*omega);
f = omega*fm/(2*pi);

%--- Euler:
s = (1 - 1./z)./T; % sustitución de Euler
 % redefino H con nuevo s.
plot(f,abs(H_E(s)));

%--- Bilineal:
s = (2*(1-1./z))./(T*(1+1./z)); % sustitución de Bilineal
plot(f,abs(H_E(s)));

legend('Respuesta del sistema continuo','Respuesta con Euler', 'Respuesta con Bilineal')
