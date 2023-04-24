function y = convolucioncircular(x,h)
  N = length(x);
  y=zeros(1,N); % lo declaro

  for k = 1:N
    for l = 1:N
      pos = mod(N+k-l,N)+1;
      y(k) += h(l)*x(pos);
    endfor
  endfor
end
