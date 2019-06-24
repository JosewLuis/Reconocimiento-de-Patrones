%Practica 1:
clear all; close all; clc;
x1=[-2:0.05:2];
y1=x1.^2-x1+3;
x2=[2:0.01:4];
y2=2*x2+1;
y3=[y1,y2];
x3=[x1,x2];
if -2<=x3 & x3<2,
    plot(x3,y3);
else
    plot(x3,y3,'m')
end,

x=-5:0.02:5;
y=x.^2-3*x-2;
z=x.^3-2*x+1;
subplot(1,2,1);plot(x,y,'g');hold on;
subplot(1,2,1);plot(2,1,'r+');hold on;
subplot(1,2,2);plot(x,z,'-b');hold on;
subplot(1,2,2);plot(2,1,'r+');hold off;

%Practica 2:
clear all; close all; clc;
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
plot(x,y,'.');hold on;
A=[x,ones(size(x))];
coefs=pinv(A)*y;
xr=[60:100];
yr=coefs(1)*xr+coefs(2);
plot(xr,yr,'r');

x=[90,86,89,81,75]';
y=[62,45,55,64,53]';
plot(x,y,'.');hold on;
A=[x,ones(size(x))];
coefs=pinv(A)*y;
xr=[60:100];
yr=coefs(1)*xr+coefs(2);
plot(xr,yr,'r');hold off;

x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
plot(x,y,'.');hold on;
A=[x.^2,x,ones(size(x))];
coefs=pinv(A)*y;
xr=[60:100];
yr=coefs(1)*xr.^2+coefs(2)*xr+coefs(3);
plot(xr,yr,'m');hold off;

x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
plot(x,y,'.');hold on;
A=[x.^3,x.^2,x,ones(size(x))];
coefs=pinv(A)*y;
xr=[60:100];
yr=coefs(1)*xr.^3+coefs(2)*xr.^2+coefs(3)*xr+coefs(4);
plot(xr,yr,'m');hold off;

x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
y=1./(y.*y);
plot(x,y,'.');hold on;
ys=log(y);
A=[x,ones(size(x))];
coefs=pinv(A)*ys;
A=coefs(1);
B=exp(coefs(2));
xr=[60:100];
yr=B*exp(A*xr);
plot(xr,yr,'r');hold off;

x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
x=x/100;
y=3*x.*exp(2*x);
%y=C*x*exp(A*x);
ys=log(y./x);
A=[x,ones(size(x))];
coefs=pinv(A)*ys;
A=coefs(1);
B=exp(coefs(2));
xr=[0:100];
yr=A*xr+exp(B*xr);
plot(x,y,'.');hold on;
axis([-10 10 -10 100]);
plot(xr,yr,'g');hold off;

%Ejercicio 4:
clear all; close all; clc;
rand('seed',0);
randn('seed',0);
N=1600; %Numero de elementos.
M=2;    %Numero de clases,
m1=[0,0];           m2=[3,3];
c1=[1,0.8;0.8,2];   c2=[1,-0.9;-0.9,2];
x1=randnorm(m1',c1,1000);
y1=[zeros(1,1000)];
y1=y1+1;
x2=randnorm(m2',c2,1000);
x3=[x1,x2];
y3=[y1,y1+1];
[x,y]=shuffle(x3,y3);
m=[meanpat(x1(:,1:800)),meanpat(x2(:,1:800))];
xs=x(:,1:1600);
ys=y(:,1:1600);
%Clasificacion usando la distancia Euclidea:
for i=1:M,    
    d(i,:)=d_euclid(xs,m(:,i));  %Calculo de distancia euclidea.
end
[~,yest]=min(d);
result1=100*sum(ys==yest)/N; 
clear m;
for i=1:M,
    ind=find(ys==i);
    m{i}=meanpat(xs(:,ind));
    c{i}=covpat(xs(:,ind));
end
%Clasificacion usando la distancia de Mahalanobis:
for i=1:M,
    d(i,:)=d_mahal(xs,m{i},c{i});
end,
[~,yest]=min(d);              
result2=100*sum(ys==yest)/N; 