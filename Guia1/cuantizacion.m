function y2=cuantizacion(y1,N)
  % Como la función sólo funciona para señales positivas
  % porque elimina las partes negativas (las vuelve 0, o
  % sea, rectifica la señal), para no perder esos valores
  % si queremos hacer una cuantización de una señal sin
  % importar que no sea positiva, la tiramos para arriba
  % restándole el mínimo a la señal completa. Luego, en
  % la salida, le sumamos el mínimo para volver a su
  % rango original.

  minimo=min(y1);
  y1=y1-minimo; % resto el mínimo
  H=max(y1)/N; % obtengo el paso H como el máximo sobre el número de niveles.
  for i=1:length(y1) % para todos los valores de la señal, aplico ecuación del cuantizador:
    if(y1(i)<(N-1)*H) % si es menor a (N-1)H
       y2(i)=H*fix(y1(i)/H); % utilizo fix para obtener la parte entera del número.
    else  % si es mayor o igual a (N-1)H
       y2(i)=(N-1)*H;
    endif
  endfor
  y2=y2+minimo;
end
