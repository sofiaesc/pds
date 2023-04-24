function y2=inversion(y1)
  % Como inversión es una operación en el dominio
  % y la función le paso solo la señal, uso la función
  % fliplr para que me invierta los valores.
  % Si le paso la t además, sólo tengo que hacer t = -t;
  y2=fliplr(y1); % invierte horizontalmente (y(t) = y(-t))

  % si quisiera invertir verticalmente (y(t) = -y(t))
  % y2=max(y1)-y1;
 end
