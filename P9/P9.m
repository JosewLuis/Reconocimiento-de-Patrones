%Ejercicio 1:
clear all; close all; clc;
%a:
randn('seed',0);
%b:
Mw1=20; Mw2=25;
Dw1=3;  Dw2=2;
x=10:0.1:30;
Nw1=5000*0.5;   Nw2=5000*0.5;
w1=normpdf(x,Mw1,Dw1);
w2=normpdf(x,Mw2,Dw2);
plot(x,w1);hold on;
plot(x,w2);hold off;
Nx1=round(Mw1+randn(1,Nw1)*Dw1);
Nx2=round(Mw2+randn(1,Nw2)*Dw2);
%c:
M1=mean(Nx1);   D1=std(Nx1);
M2=mean(Nx2);   D2=std(Nx2);
%Viendo los resultados, un numero entre 17-23 sera clase A y un numero
%entre 23-27 sera clase B.
%d:
Nw1=5000*0.7;   Nw2=5000*0.3;
x=10:0.1:30;
w1=normpdf(x,Mw1,Dw1);
w2=normpdf(x,Mw2,Dw2);
plot(x,w1);hold on;
plot(x,w2);hold off;
Nx1=round(Mw1+randn(1,Nw1)*Dw1);
Nx2=round(Mw2+randn(1,Nw2)*Dw2);
M1=mean(Nx1);    D1=std(Nx1);
M2=mean(Nx2);    D2=std(Nx2);
%Viendo los resultados, un numero entre 17-23 sera clase A y un numero
%entre 23-27 sera clase B.
%e:
x=10:0.1:30;
w1=normpdf(x,Mw1,Dw1);
w2=normpdf(x,Mw2,Dw2);
plot(x,w1);hold on;
plot(x,w2);hold off;
Nw1=5000*0.3;   Nw2=5000*0.7;
Nx1=round(Mw1+randn(1,Nw1)*Dw1);
Nx2=round(Mw2+randn(1,Nw2)*Dw2);
M1=mean(Nx1);    D1=std(Nx1);
M2=mean(Nx2);    D2=std(Nx2);
%Viendo los resultados, un numero entre 17-23 sera clase A y un numero
%entre 23-27 sera clase B.
%Con esta estimacion tan basica la frontera de decision no varia, lo cual
%no tiene sentido a nivel riguroso ya que hay un numero desproporcionado de
%datos en una de las dos clases.

%Ejercicio 2:
%a:
Nw1=5000*0.5;   Nw2=5000*0.5;
x=10:0.1:30;
w1=normpdf(x,Mw1,Dw1);
w2=normpdf(x,Mw2,Dw2);
subplot(1,2,1);plot(x,w1);hold on;
subplot(1,2,1);plot(x,w2);hold off;
X=[Mw1+randn(1,Nw1)*Dw1,Mw2+randn(1,Nw2)*Dw2];
Y=[ones(1,Nw1),2*ones(1,Nw2)];
[X,Y]=shuffle(X,Y);
x=X(1:1000);
y=Y(1:1000);
%Metodo de la distancia minima:
m1=mean(x(find(y==1)));
m2=mean(x(find(y==2)));
s1=std(x(find(y==1)));
s2=std(x(find(y==2)));
Pw1=length(find(y==1))/length(y);
Pw2=length(find(y==2))/length(y);
%Dibujo:
A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;
x1=(-B+sqrt(B*B-4*A*C))/2/A;
x2=(-B-sqrt(B*B-4*A*C))/2/A;
xi=10:0.1:30;
subplot(1,2,2);plot(xi,log(Pw1*normpdf(xi,m1,s1)));hold on;
subplot(1,2,2);plot(xi,log(Pw2*normpdf(xi,m2,s2)),'r');hold off;
%La frontera de decision es 22.5, este metodo es mucho mejor y daria
%diferentes resultados si lo aplicas a proporciones desiguales.
%b:
Nw1=5000*0.2;   Nw2=5000*0.8;
x=10:0.1:30;
w1=normpdf(x,Mw1,Dw1);
w2=normpdf(x,Mw2,Dw2);
subplot(1,2,1);plot(x,w1);hold on;
subplot(1,2,1);plot(x,w2);hold off;
X=[Mw1+randn(1,Nw1)*Dw1,Mw2+randn(1,Nw2)*Dw2];
Y=[ones(1,Nw1),2*ones(1,Nw2)];
[X,Y]=shuffle(X,Y);
x=X(1:1000);
y=Y(1:1000);
%Metodo de la distancia minima:
m1=mean(x(find(y==1)));
m2=mean(x(find(y==2)));
s1=std(x(find(y==1)));
s2=std(x(find(y==2)));
Pw1=length(find(y==1))/length(y);
Pw2=length(find(y==2))/length(y);
%Dibujo:
A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;
x1=(-B+sqrt(B*B-4*A*C))/2/A;
x2=(-B-sqrt(B*B-4*A*C))/2/A;
xi=10:0.1:30;
subplot(1,2,2);plot(xi,log(Pw1*normpdf(xi,m1,s1)));hold on;
subplot(1,2,2);plot(xi,log(Pw2*normpdf(xi,m2,s2)),'r');hold off;
%Ahora la frontera de decision es 21.8, con esto podemos ver que con este
%metodo si cambia , no como el metodo anterior. Podemos concluir que este
%metodo es mejor.
