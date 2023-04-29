function y = convolucioncircular(x,h)
  % x y h periódicas de periodo N

  N = length(x);
  y=zeros(1,N); % lo declaro

  for k = 1:N
    for l = 1:N
      pos = mod(N+k-l,N)+1; % mod divide por un periodo concreto
                            % sumo N para que el mod no de cosas raras por ser negativo.
      y(k) += h(l)*x(pos);
    endfor
  endfor
end
