function fo = frec_obs(fs,fm)
  fo = abs(fs - fm*round(fs/fm));
end

% El aliasing se produce cuando la señal original tiene fm > fs/2.
% La fórmula round(fs/fm) calcula la relación entre fm y fs, diciéndonos
% cuántas veces la señal original cabe dentro de la frecuencia de muestreo.
% Cuando multiplicamos esto por la frecuencia de muestreo, obtenemos la
% frecuencia de la señal original que se superpone con la señal muestreada
% y produce aliasing.
% Luego, se hace la frecuencia de la señal original menos la frecuencia
% de la señal original ajustada (la señal falsa que se observa por alias).
% Hago el valor absoluto para obtener la frecuencia en positivo.
