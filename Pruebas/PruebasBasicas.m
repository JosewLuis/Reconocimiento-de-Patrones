v=[1;2;3];           %Declaracion vector.
v1=[1:0.2:2];        %Declaracion implicita vector.
v2=[1:10];           %Si intervalo=1, se puede omitir.
v2(2:5:end);         %Acceso a vector.
v2(:);               %Los extrae en columnas.
v(:);
v';                  %Traspuesta de v.
sum(v);              %Suma cada columna.
prod(v);             %Producto de cada columna.
find(v2~=1);         %Comando find.


m1=[1,2,3;4,5,6;7,8,9];      %Matriz 3x3.
m2=[m1;m1];                  %Dos maneras de realizar una matriz por composicion de otras matrices.
m2=[m1,m1];
m1=m1+m1;
m1=m1-m1;
