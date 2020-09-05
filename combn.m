 % ���������� ������ ���� ���� (����������) � �������� A ������ n
function retval=combn(A,n),
   w=ones(1,n) * A(1) ;
   retval=combn_(A,n,w,1) ;
endfunction 
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
function retval=combn_(A,n,w,k),
   m=size(A,2) ; % ������ ��������
   for i=1:m,
	  w(end,k)=A(i) ;
      if(k<n),
		 w=combn_(A,n,w,k+1) ;
      else
		 w(end+1,:)=w(end,:) ;
      endif
   endfor
   retval=w;
endfunction
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% n=4 ; % ������ �����
% A=[1 2] ; % �������
% 
% c=comb(A,n) 
%   
% ��� ��������������� ��������   
% c=unique(sort(c,2),"rows")


