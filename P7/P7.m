clear all, close all, clc
%Ejercicio 1:
%a:
rand('seed',0);
X=fix(rand(1,30)*100);
%b:
for i=1:10,
    c1=(((i-1)*10)<=X);  c2=(X<=((i-1)*10)+9);
    x(i)=length(X(c1&c2));
end,
%c:
hist(X);        %Cuenta los elementos en cada intervalo de 10.
[a,b]=hist(X);  %a=Contador, b=Centros.
c=hist(X,5:10:95);  %Cuenta los elementos en intervalos de 10 desde 5 a 95.
[a,b]=hist(X,5:10:95);  %Lo mismo pero desde 5 a 95.
%d: No entiendo exactamente que pretende esta pregunta, pero el primer y el
%ultimo intervalo representan la cantidad de numeros de la distribucion
%entre 0<X<9 y 90<X<99 respectivamente.
%e:
total=sum(X);
%f:
for i=1:10,
    p{i}=(a(i)*100)/length(X);
end,
%g: 100%.
%h:
X=fix(rand(1,1000)*100);
hist(X);
%Tras la observacion del histograma correspondiente, al incrementar el
%numero de datos, las probabilidades de que se encuentren en un intervalo
%se acercan, lo cual indica que habra que realizar unos intervalos mas
%extensos.
%i:
X=fix(rand(1,100000)*100);
figure,hist(X);
%Seria mas optimo:
figure,hist(X,0:20:100);

%Ejercicio 2:
clear all, close all, clc
X=rand(1,100000);
Y=randn(1,100000);
figure,hist(X);
figure,hist(Y);
%b:
x=mean(X);  y=mean(Y);
x1=sum(X);  y1=sum(Y);
xm=min(X);  ym=min(Y);
xM=max(X);  yM=max(Y);
%c:
ymean=mean(Y);
ystd=std(Y);
%d: [m-s,m+s], [m-2s,m+2s], [m-3s,m+3s].
c1=(ymean-ystd)<=Y; c2=Y<=(ymean+ystd);
f1=Y(c1&c2);
c1=(ymean-2*ystd)<=Y;   c2=Y<=(ymean+2*ystd);
f2=Y(c1&c2);
c1=(ymean-3*ystd)<=Y;   c2=Y<=(ymean+3*ystd);
f3=Y(c1&c2);