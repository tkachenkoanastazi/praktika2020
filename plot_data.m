function plot_data(X,Y,file,J),

   pix_size="-S1040,1040";
   pix_font_size=30;
   pix_format="gif";
   fm=sprintf("-d%s",pix_format);

   xm=ceil(max(max(X))) ; ax=[ 0 xm 0 xm ] ;

   szX=size(X,1) ;

   clf; hold on; axis(ax); grid on; set(gca,"fontsize",pix_font_size); 
   plot_points(X,Y);
   file=sprintf("result/%s.%s",file,pix_format);
   title(sprintf("points: %i",szX)) ;
   print(file,fm,pix_size) ;

   if isempty(J), return;endif

   sj=size(J,2) ;

   xm=ceil(max(J)) ; ax=[ 1 sj 0 xm ] ;
   clf; hold on; axis(ax); grid on; set(gca,"fontsize",pix_font_size); 
   plot( 1:sj , J, "-r") ; 
   file=sprintf("result/j.%s",pix_format);
   fm=sprintf("-d%s",pix_format);
   title(sprintf("steps: %i, error: %f",sj,min(J)) ) ;

   print(file,fm,pix_size) ;

endfunction
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
function plot_points(X,Y),
   % номера классов
   cl=unique(Y)' ;
   % clr=jet(size(cl,2)) ;
   clr=[ 
	 0 0 1 ;
   1 0 0 ;
	 0 1 0 ;
	 1 0 1 ;       
	 1 1 0 ;
	 0 1 1 
   ] ;

   for c=cl,
	  ix=find(Y==c) ;
	  if !isempty(ix), plot( X(ix,1), X(ix,2), "x", "color", clr(c+1,:) ) ; endif
   endfor
endfunction

