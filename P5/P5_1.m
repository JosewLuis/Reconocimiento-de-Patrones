clear all, close all, clc
load iris;
y=y+1;
%Ejercicio 1:
%a:
x1=x(1:4:600); 
x2=x(2:4:600);
xk{1}=[x1;x2];

x1=x(1:4:600);
x2=x(3:4:600);
xk{2}=[x1;x2];

x1=x(1:4:600);
x2=x(4:4:600);
xk{3}=[x1;x2];

x1=x(2:4:600);
x2=x(3:4:600);
xk{4}=[x1;x2];

x1=x(2:4:600);
x2=x(4:4:600);
xk{5}=[x1;x2];

x1=x(3:4:600);
x2=x(4:4:600);
xk{6}=[x1;x2];

maxK=10;    %Usaremos un maximo de k=10.

for i=1:1:6,
    for j=1:1:maxK,
        centroides{i,j}=xk{i}(:,1:j);
    end,
end,

for i=1:150,
    for j=1:maxK,
      d(j,:) = d_euclid(x,centroides(:,j));
    end


end,
