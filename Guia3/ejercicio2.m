[t,x]=senoidal(0,1,100,5,1,0);
[t,y]=senoidal(0,1,100,3,1,0);

clf
plot(t,x)
hold on
plot(t,y)

p_i = dot(x,y)
maximo = norm(x,2)*norm(y,2)
