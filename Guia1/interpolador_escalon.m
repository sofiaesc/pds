function t1 = interpolador_escalon(t0)
  if(t0 >= 1e-12 && t0 <= 1)
     t1 = 1;
   else
     t1 = 0;
   endif
 end
