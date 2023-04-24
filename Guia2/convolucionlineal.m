function y = convolucionlineal(x,h)
  n = length(x);
  m = length(h);
  y=zeros(1,n+m-1);

  for i=1:m
    for k=1:n
      y(i+k-1) += x(k)*h(i);
      % tengo que restar 1 porque empiezo desde 1 en octave
    endfor
  endfor
end

