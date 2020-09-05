function retval=build_polynom(D,n),
   s=size(D{1}{1},2); % количество признаков
   c=combn([1:s+1],n) ;
   % список сочетаний номеров элементов из X
   % длинны n
   % без повторов 
   c=unique(sort(c,2),"rows") ;

   for i=1:size(D,2),
	  X=D{i}{1};
	  m=size(X,1); % количество объектов
	  X=[ ones(m,1) X ] ; % добавляем свободный член
	  % строим полином
	  Xp=[];
	  for j=1:size(c,1),
		 Xp=[ Xp prod(X(:,c(j,:)),2) ];
	  endfor
	  D{i}{1}=Xp;
   endfor
   retval=D;
endfunction 

