function X = dft(x)
  N = length(x);
  X = zeros(1, N);
  for k = 0:N-1
    for n = 0:N-1
      X(k+1) += x(n+1) * exp(-j*2*pi*k*n/N);
    end
  end
  % Doy vuelta para tener las frecuencias negativas primero:
  aux = X(N/2+1:N);
  X = [aux X(1:N/2)];
end
