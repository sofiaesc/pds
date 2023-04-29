function x = idft(X)
  N = length(X);

  % Vuelvo a dar vuelta para dar resultado original.
  aux = X(1:N/2);
  X = [X(N/2+1:N) aux];

  x = zeros(1,N)
  for k = 0:N-1
    for n = 0:N-1
        x(n+1) += X(k+1) * exp(-j*2*pi*k*n/N);
    endfor
  endfor

  x = x/N;
