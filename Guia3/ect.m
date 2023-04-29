function [er] = ect(f1,f2)
  % forma vectorial más rápida:
  er = sum((f1 - f2).^2);
  %{
  % tiempo de ejecución más lento con for:
  er = 0;
  for i=1:length(f1)
    er+=(f1(i)-f2(i))^2;
  endfor
  %}
 endfunction
