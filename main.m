
printf("Загружаем данные\n") ;
D=load_data();

% степень полинома
n=3;

printf("Строим полином степени %i\n",n) ;
Dp=build_polynom(D,n);

printf("Обучаем\n") ;
[T J]=training(Dp{1},Dp{2});
save("-text","result/t.txt", "T") ;
save("-text","result/j.txt", "J") ;

printf("Тестируем\n") ;
X=Dp{3}{1};
Y=(sign(hypothesis(X,T)-0.5)+1.0)/2.0;

printf("Рисуем результат\n") ;
X=D{3}{1};
plot_data(X,Y,"xres",J) ;


