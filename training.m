
function [T J]=training(L,C),
   % ������� �������
   X=L{1}; Y=L{2};
   % ���������� ����� � �������
   m=size(X,1) ;
   % ������ ������������ ���������
   n=size(X,2)-1 ;

   % ��������� �������� ������� ���������
   J=[ 30 20 10 ] ; 
   % ��������� ����������� ��������
   T=[ 0 ; ones(n,1) ] ; 
   % �������� �������������
   lambda=1.5 ; 
   % �������� ��������
   alpha=0.01 ; 
   % ��������� �������� ��������
   alpha_step=1.0 ; 

   % ������������ ����� ������ ��������
   MAX_ITER = 10000 ; 

   % ��������� ������������ ������
   for iter=1:MAX_ITER,
      % ��������� �����
	  h=hypothesis(X,T);
      % �������� ������
	  e=h-Y;

	  % �������������
	  r=(lambda/m)*T ; r(1)=0.0 ;
	  
	  % �������� �����������
	  T=T-alpha*(sum(X.*e)'+r) ;

	  % ������ ���������� �� ����������� �������
	  J(end+1)=cost(C{1},C{2},T,lambda);

	  % �������� ����-�������
	  if stop_condition(J),break; endif 

	  printf("%i: %f        \r",iter,J(end));

	  % �������� �������� ��������
	  alpha = alpha * alpha_step ; 
   endfor

   if ( iter+1 > MAX_ITER ), 
	  printf("��������� ����� ������������� ����� ������\n"); 
   endif

   J=J(4:end);

endfunction 


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% ������� ���������
function retval=cost(X,Y,T,lambda),
   h=hypothesis(X,T) ;
   retval=msqe(Y,h);

endfunction 


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% ������� ��������� ��������
function retval=stop_condition(J),
   MIN_ERROR = 0.03;
   MIN_ERROR_DIFF = 10e-5;
   retval=0;

   if (J(end) < MIN_ERROR ), 
	  printf("��������� ����� ����������� ������\n"); 
      retval=1;
	  return ; 
   endif

   if ( ( J(end) >= J(end-1) ) & ( J(end-1) >= J(end-2) ) ), 
	  printf("���������� ���� ������\n"); 
      retval=1;
	  return ; 
   endif

endfunction 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% ������� �������������� ������
function retval=msqe(c,r),
   e=sum( sum((c-r).^2,2) );
   s=size(r,1) ;
   retval=(e/s) ;
endfunction


