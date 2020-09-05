 % генерирует список всех слов (комбинаций) в алфавите A длинны n
function retval=combn(A,n),
   w=ones(1,n) * A(1) ;
   retval=combn_(A,n,w,1) ;
endfunction 
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
function retval=combn_(A,n,w,k),
   m=size(A,2) ; % размер алфавита
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
% n=4 ; % длинна слова
% A=[1 2] ; % алфавит
% 
% c=comb(A,n) 
%   
% без перестановочных повторов   
% c=unique(sort(c,2),"rows")


