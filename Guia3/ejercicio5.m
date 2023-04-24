signal=load("te.txt");

fm=11025;
T=1/fm;
n=length(signal)
tf=n/fm;
t=0:T:tf-T;

plot(signal)
hold on

fila_1=senoidal(0,0.1,100,697,1,0);
fila_2=senoidal(0,0.1,100,770,1,0);
fila_3=senoidal(0,0.1,100,852,1,0);
fila_4=senoidal(0,0.1,100,941,1,0);

columna_1=senoidal(0,0.1,100,1209,1,0);
columna_2=senoidal(0,0.1,100,1336,1,0);
columna_3=senoidal(0,0.1,100,1477,1,0);

stem(16000,1)
stem(22500,1)

primer_numero=senoidal(16000,22500,729,);
