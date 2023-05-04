% Dado un sistema continuo, obtener un sistema discreto que se comporte igual.
% Sirve para poder tratarlo en la computadora.
% Tengo la H(s), tengo que transformarla en H(z), encontrar la ecuación en dif.
% y hacer lo que se me cante con eso.

% Para obtener H(z) que se comporte lo más parecido a la H(s), tengo que:
% Si reemplazo s = ln(z)/t (mapeo ideal) no quedo en z sino en logaritmo de z.
% Entonces uso mapeos aproximados (tengo que ver qué tan aproximadas son, cuándo
% funcionan y cuando no, TENER CUIDADO).

clc; clf; clear all;

%--------------------------------------%
%----------------DATOS-----------------%

N = 5000; % número de muestras
w = 0:N; % rango de muestras
f = w/(2*pi); % vector de frecuencias

% Respuesta del sistema continuo:
s = j*w; % defino mi s
H = @(s) 12500*s ./ (44*s.^2 + 60625*s + 625 * 10^4);
figure(1)
hold on
plot(f,abs(H(s)))

% Frecuencia de corte:
% Corresponde a la frecuencia en la cual la respuesta en frecuencia
% del sistema alcanza una ganancia de -3 dB, esto es, se reduce la
% magnitud a la mitad.
magH = abs(H(s));
maxH = max(magH)
i_maxH = find(magH >= maxH);
f_maxH = f(i_maxH)
plot(f_maxH,maxH,'m*') % máximo

ic = find(magH >= maxH/2,1,'last')
fc = f(ic)
H(ic)
plot(fc,maxH/2,'*') % frecuencia de corte

fm = 4*fc; % se pide que fm sea cuatro veces superior a la frecuencia de corte.
T = 1/fm; % periodo de muestreo

%--------------------------------------%
%-----------TRANSFORMACIONES-----------%

omega = 0:pi/N:pi;
z = e.^(j*omega); % e^jw

%--- Euler:
s = (1 - 1./z)./T; % sustitución de Euler
plot(f,abs(H(s)));

%--- Bilineal:
s = (2*(1-1./z))./(T*(1+1./z)); % sustitución de Bilineal
plot(f,abs(H(s)));

legend('Respuesta del sistema continuo','H(fmax)','H(fc)','Respuesta con Euler', 'Respuesta con Bilineal')


