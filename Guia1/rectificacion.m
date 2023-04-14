function y2=rectificacion(y1)
  # Convierte los valores negativos en 0.
 y2=y1;
 for i=1:length(y1);
   if (y1(i)<0) # Si ese punto de la señal es negativo.
     y2(i)=0; # Lo seteo en 0.
   endif
  endfor
  end
