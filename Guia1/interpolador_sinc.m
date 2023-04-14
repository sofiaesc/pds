function t1 = interpolador_sinc(fs,t0)
   x=2*pi*fs*t0;
  if(x==0)
     t1=1;
   else
     t1=sin(x)/x;
   endif
 end
