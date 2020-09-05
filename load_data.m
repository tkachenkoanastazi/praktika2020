
% каждый класс разделяется в заданной пропорции на три набора
% [ учебный | контрольный | тестовый ]
% номера точек выбираются случайным образом
function retval=load_data(),
   points={};
   cl={};

   sf=[ -0.05 0.1 ] ; % сдвиг
   sc=[ 0.15  0.16 ] ; % масштабирование
   points(1)=load("data/200_2b/points_1.txt").*sc + sf;
   points(2)=load("data/200_2b/points_2.txt").*sc + sf; 
   % распределение точек по наборам - учебный | контрольный | тестовый (все остальные)
   r=[ 0.3 0.3 ];
   % два класса  
   cl(1)=[ points{1} ] ; 
   cl(2)=[ points{2} ] ;
 
   % считаем общее количество точек
   s=0;for i=1:size(points,2), s+=size(points{i},1); endfor


   % - - - - - - - - - - - - - - - - - - - - 
   % количество классов
   ncl=size(cl,2)  ;

   Xl=Xc=Xt=[] ;
   Yl=Yc=Yt=[] ;
   % случайным образом разделяем каждый класс 
   % на три набора точек в пропорции r
   for i=1:ncl,
      % размер класса i
	  sz=size(cl{i},1) ;
      % точки класса i

	  cli=[ cl{i} ];
	  % выход для класса i
	  out=zeros(sz,1)+(i-1) ;

	  % все номера в случайном порядке 
	  ir=randperm(sz) ; 
	  n1=round(sz*r(1)) ; n2=round(sz*r(2))+n1 ;
	  il=ir(1:n1);        % номера точек учебного     набора
	  ic=ir((n1+1):n2) ;  % номера точек контрольного набора
	  it=ir((n2+1):end) ; % номера точек тестового    набора

	  Xl=[ Xl ; cli(il,:) ] ; 
	  Yl=[ Yl ; out(il,:) ] ;
	  
	  Xc=[ Xc ; cli(ic,:) ] ; 
	  Yc=[ Yc ; out(ic,:) ] ;
	  
	  Xt=[ Xt ; cli(it,:) ] ; 
	  Yt=[ Yt ; out(it,:) ] ;
   endfor

   save("-text","result/xl.txt", "Xl" ) ;
   save("-text","result/yl.txt", "Yl" ) ;

   save("-text","result/xc.txt", "Xc" ) ;
   save("-text","result/yc.txt", "Yc" ) ;

   save("-text","result/xt.txt", "Xt" ) ;
   save("-text","result/yt.txt", "Yt" ) ;

   plot_data(Xl,Yl,"xl",[]) ;
   plot_data(Xc,Yc,"xc",[]) ;
   plot_data(Xt,Yt,"xt",[]) ;

   D={ {Xl,Yl}, {Xc,Yc} , {Xt,Yt} } ;

   printf("%i - %i / %i / %i \n",s, size(Xl,1),size(Xc,1),size(Xt,1) );

   retval=D;

endfunction

