function y = convolucionlineal(x,h)
  n = length(x);
  m = length(h);
  y=zeros(1,n+m-1);

  for i=1:m
    for k=1:n
      y(i+k-1) += h(k)*x(i);
    endfor
  endfor
end

% ---------------------------
% EJEMPLO PARA n = 4 Y m = 4:

% ------> ITERACIÓN i = 1:
% y(1) = h(1)*x(1);
% y(2) = h(2)*x(1);
% y(3) = h(3)*x(1);
% y(4) = h(4)*x(1);

% ------> ITERACIÓN i = 2:
% y(2) = h(2)*x(1) + h(1)*x(2);
% y(3) = h(3)*x(1) + h(2)*x(2);
% y(4) = h(4)*x(1) + h(3)*x(2);
% y(5) = h(4)*x(2);

% ------> ITERACIÓN i = 3:
% y(3) = h(3)*x(1) + h(2)*x(2) + h(1)*x(3);
% y(4) = h(4)*x(1) + h(3)*x(2) + h(2)*x(3);
% y(5) = h(4)*x(2) + h(3)*x(3);
% y(6) = h(4)*x(3);

% ------> ITERACIÓN i = 3:
% y(4) = h(4)*x(1) + h(3)*x(2) + h(2)*x(3) + h(1)*x(4);
% y(5) = h(4)*x(2) + h(3)*x(3) + h(2)*x(4);
% y(6) = h(4)*x(3) + h(3)*x(4);
% y(7) = h(4)*x(4);

% SISTEMA FINAL:
% y(1) = h(1)*x(1);
% y(2) = h(2)*x(1) + h(1)*x(2);
% y(3) = h(3)*x(1) + h(2)*x(2) + h(1)*x(3);
% y(4) = h(4)*x(1) + h(3)*x(2) + h(2)*x(3) + h(1)*x(4);
% y(5) = h(4)*x(2) + h(3)*x(3) + h(2)*x(4);
% y(6) = h(4)*x(3) + h(3)*x(4);
% y(7) = h(4)*x(4);
