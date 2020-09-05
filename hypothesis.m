function retval=hypothesis(X,T),
   retval= 1.0 ./ (1.0+exp(-1.0*( X*T))) ;
endfunction 

