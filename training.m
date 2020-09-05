
function [T J]=training(L,C),
   % учебна€ выборка
   X=L{1}; Y=L{2};
   % количество точек в выборке
   m=size(X,1) ;
   % размер пространства признаков
   n=size(X,2)-1 ;

   % начальные значени€ функции стоимости
   J=[ 30 20 10 ] ; 
   % начальные коэфициенты полинома
   T=[ 0 ; ones(n,1) ] ; 
   % параметр регул€ризации
   lambda=1.5 ; 
   % скорость обучени€
   alpha=0.01 ; 
   % изменение скорости обучени€
   alpha_step=1.0 ; 

   % максимальное число циклов обучени€
   MAX_ITER = 10000 ; 

   % процедура градиентного спуска
   for iter=1:MAX_ITER,
      % вычисл€ем выход
	  h=hypothesis(X,T);
      % значени€ ошибок
	  e=h-Y;

	  % регул€ризаци€
	  r=(lambda/m)*T ; r(1)=0.0 ;
	  
	  % измен€ем коэфициенты
	  T=T-alpha*(sum(X.*e)'+r) ;

	  % оценка результата по контрольной выборке
	  J(end+1)=cost(C{1},C{2},T,lambda);

	  % проверка стоп-условий
	  if stop_condition(J),break; endif 

	  printf("%i: %f        \r",iter,J(end));

	  % измен€ем скорость обучени€
	  alpha = alpha * alpha_step ; 
   endfor

   if ( iter+1 > MAX_ITER ), 
	  printf("достигнут порог максимального числа циклов\n"); 
   endif

   J=J(4:end);

endfunction 


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% функци€ стоимости
function retval=cost(X,Y,T,lambda),
   h=hypothesis(X,T) ;
   retval=msqe(Y,h);

endfunction 


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% услови€ остановки обучени€
function retval=stop_condition(J),
   MIN_ERROR = 0.03;
   MIN_ERROR_DIFF = 10e-5;
   retval=0;

   if (J(end) < MIN_ERROR ), 
	  printf("достигнут порог минимальной ошибки\n"); 
      retval=1;
	  return ; 
   endif

   if ( ( J(end) >= J(end-1) ) & ( J(end-1) >= J(end-2) ) ), 
	  printf("монотонный рост ошибки\n"); 
      retval=1;
	  return ; 
   endif

endfunction 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% средн€€ квадратическа€ ошибка
function retval=msqe(c,r),
   e=sum( sum((c-r).^2,2) );
   s=size(r,1) ;
   retval=(e/s) ;
endfunction


