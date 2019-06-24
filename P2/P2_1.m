
%Ejercicio 1:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';

%a:
%Si, ya que, como podemos apreciar, a mayor x, mayor suele ser su y.

%b:
%Ajuste metodo de la pseudoinversa, para cualquier numero de entradas
A=[x,ones(size(x))];
coefs=pinv(A)*y;   %Sacamos los coeficientes necesarios.
%Mostramos los resultados.
xr=[40:100];
yr=coefs(1)*xr+coefs(2);
plot(x,y,'r+');hold on;
plot(xr,yr,'b-');hold on;
axis([40 95 30 95]);

%c:
x=[90,86,89,81,75]';
y=[62,45,55,64,53]';
A=[x,ones(size(x))];
coefs1=inv(A'*A)*A'*y;   %Sacamos los coeficientes necesarios.
%Mostramos los resultados.
xr=[30:100];
yr=coefs1(1)*xr+coefs1(2);
plot(x,y,'k+');hold on;
axis([40 95 30 95]);
plot(xr,yr,'m-');hold on;
%Conclusion: La diferencia entre los coeficientes es grandes, esto se debe
%a que el dato mas extremo (67,40) ha sido eliminado y,como podemos ver en
%el resultado grafico, la recta del ajuste varia muchisimo

%d: 
%Para el caso a:
y1=coefs(1)*88+coefs(2);
plot(88,y1,'go');hold on;
%Para el caso b:
y2=coefs1(1)*88+coefs1(2);
plot(88,y2,'go');hold off;

%e: Podemos asegurar que los puntos X con menor error seran aquellos sobre
%los que hicimos nuestra regresion lineal.

%f:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
plot(x,y,'x');hold on;
axis([40 95 30 95]);
A=[x.^2,x,ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=60:0.01:100;
yr=coefs(1)*xr.^2+coefs(2)*xr+coefs(3);
plot(xr,yr,'r-');hold off;

%g:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
plot(x,y,'x');hold on;
axis([40 95 30 95]);
A=[x.^3,x.^2,x,ones(size(x))];
coefs=pinv(A)*y;
xr=60:0.01:100;
yr=coefs(1)*xr.^3+coefs(2)*xr.^2+coefs(3)*xr+coefs(4);
plot(xr,yr,'m-');hold off;

%h:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
y=1./(y.*y);
ys=log(y);
A=[x,ones(size(x))];
coefs=inv(A'*A)*A'*ys;
B=coefs(1);
A=exp(coefs(2));
xr=[60:100];
yr=A*exp(B*xr);
plot(x,y,'x');hold on;
plot(xr,yr,'m-');hold off;

%i:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
x=x/100;
y=3*x.*exp(2*x);
ys=log(y./x);
A=[x,ones(size(x))];
coefs=inv(A'*A)*A'*ys;
A=coefs(1);
B=exp(coefs(2));
xr=0:100;
yr=A*xr+exp(B*xr);
plot(x,y,'x');hold on;
axis([-10 10 -10 100]);
plot(xr,yr,'m-');hold off;
%En este modelo, efectivamente C=3 y A=2. 
