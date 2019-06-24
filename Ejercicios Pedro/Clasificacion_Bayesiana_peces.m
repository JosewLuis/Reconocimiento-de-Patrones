clear all, close all , clc

rand('seed',0);  randn('seed',0);

NumD = 0.2e6;
NumL = 3.8e6;

LongD = 25;
LongL = 32;

stdD  = 3; 
stdL  = 3; 

X = [LongD+stdD*randn(1,NumD) LongL+stdL*randn(1,NumL)];
Y = [ones(1,NumD) 2*ones(1,NumL)];
    
[X,Y]=shuffle(X,Y);

x=X(1:1000);
y=Y(1:1000);

% Me olvido de X e Y. Solo tengo x e y

% Metodo de la distancia minima
m1 = mean(x(find(y==1)));
m2 = mean(x(find(y==2)));
s1 =  std(x(find(y==1)));
s2 =  std(x(find(y==2)));
Pw1 = length(find(y==1))/length(y);
Pw2 = length(find(y==2))/length(y);

% Dibujo
A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;
x1=(-B+sqrt(B*B-4*A*C))/2/A
x2=(-B-sqrt(B*B-4*A*C))/2/A

xi=15:0.1:200;
plot(xi,log(Pw1*normpdf(xi,m1,s1)));hold on;
plot(xi,log(Pw2*normpdf(xi,m2,s2)),'r');hold off;

return


m = (m1+m2)/2;


aux = y(find(x<m));
e1 = length(find(aux==2));
aux = y(find(x>m));
e2 = length(find(aux==1));
e = e1+e2

xi=15:0.1:40;
plot(xi,P1*normpdf(xi,m1,s1));hold on;
plot(xi,P2*normpdf(xi,m2,s2),'r');hold off;