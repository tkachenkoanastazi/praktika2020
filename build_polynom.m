function retval=build_polynom(D,n),
   s=size(D{1}{1},2); % ���������� ���������
   c=combn([1:s+1],n) ;
   % ������ ��������� ������� ��������� �� X
   % ������ n
   % ��� �������� 
   c=unique(sort(c,2),"rows") ;

   for i=1:size(D,2),
	  X=D{i}{1};
	  m=size(X,1); % ���������� ��������
	  X=[ ones(m,1) X ] ; % ��������� ��������� ����
	  % ������ �������
	  Xp=[];
	  for j=1:size(c,1),
		 Xp=[ Xp prod(X(:,c(j,:)),2) ];
	  endfor
	  D{i}{1}=Xp;
   endfor
   retval=D;
endfunction 

