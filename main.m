
printf("��������� ������\n") ;
D=load_data();

% ������� ��������
n=3;

printf("������ ������� ������� %i\n",n) ;
Dp=build_polynom(D,n);

printf("�������\n") ;
[T J]=training(Dp{1},Dp{2});
save("-text","result/t.txt", "T") ;
save("-text","result/j.txt", "J") ;

printf("���������\n") ;
X=Dp{3}{1};
Y=(sign(hypothesis(X,T)-0.5)+1.0)/2.0;

printf("������ ���������\n") ;
X=D{3}{1};
plot_data(X,Y,"xres",J) ;


