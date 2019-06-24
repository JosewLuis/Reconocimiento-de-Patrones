clear all, close all, clc
%Ejercicio 1:
%a:
randn('seed',0);
%b:
N1=1000;
M1=[3,4];
V1=[1,0.8;0.8,1];
x=randnorm(M1',V1,N1);
subplot(2,3,1);plotpat(x);title('Original');
%c:
x=x-x(1,1);
%d:
W=pca(x);
xprim=W*x;
x1=pinv(W)*xprim;
subplot(2,3,2);plotpat(x1);title('Reconstruccion ap. d');
%f:
x2=pinv(W)*x1;
subplot(2,3,3);plotpat(x2);title('Datos recompuestos');
%g:
W=pca(x,2);
xprim=W*x;
x3=pinv(W)*xprim;
subplot(2,1,2);plotpat(x3,'om'),title('PCA dim. 2');
%Tras realizar la impresion, se puede observar con claridad que se produce
%una perdida de informacion.
%h:
%En este caso no afecta el aumenteo de la W, la perdida es la misma.

clear all, close all, clc
%Ejercicio 2:
%a:
randn('seed',0);
%b:
w1=1000;    Mw1=[3,4];  Cw1=[1,0.8;0.8,1];
w2=1000;    Mw2=[5,0];  Cw2=[1,0.8;0.8,1];
xw1=randnorm(Mw1',Cw1,w1);
xw2=randnorm(Mw2',Cw2,w2);
subplot(3,2,1);plotpat(xw1);title('Original 1');
subplot(3,2,2);plotpat(xw2);title('Original 2');
%c:
W=pca(xw1,2);
xprim=W*xw1;
xw1_2=pinv(W)*xprim;
subplot(3,2,3);plotpat(xw1_2,'ob');title('PCA dim 2 de 1');
W=pca(xw2,2);
xprim=W*xw2;
xw2_2=pinv(W)*xprim;
subplot(3,2,4);plotpat(xw2_2,'ob');title('PCA dim 2 de 2');
%d:

clear all, close all, clc
%Ejercicio 3:
%a:
load DNATRN;
subplot(2,3,2);plotpat(x,y);title('Original data');
%PCA:
W=pca(x,2);
xprim=W*x;
x2=pinv(W)*xprim;
subplot(2,3,4);plotpat(x2,y),title('PCA');
%FISHER:
W=fisher(x,y,2);
xprim=W*x;
x2=pinv(W)*xprim;
subplot(2,3,6);plotpat(x2,y);title('FISHER');
%Siempre es mejor el metodo de fisher, ya que es mas completo y produce
%menos error, independientemente de la funcion.
%b:
clear all,close all,clc;
load DIABETES;
y=y';
subplot(3,3,2);plotpat(x,y);title('Original');
%PCA:
W=pca(x,1);
xprim=W*x;
x2=pinv(W)*xprim;
subplot(3,3,4);plotpat(x2,y),title('PCA');
%Ahora realizamos la regresion:
A=[xprim',ones(size(xprim'))];
coefs=inv(A'*A)*A'*y;
yr=coefs(1)*xprim+coefs(2);
subplot(3,3,7);plot(xprim,yr);title('Regresion linear PCA');
%FISHER:
w=fisher(x,y,1);
xprim=W*x;
x2=pinv(W)*xprim;
subplot(3,3,6);plotpat(x2,y),title('FISHER');
%Ahora realizamos la regresion:
A=[xprim',ones(size(xprim'))];
coefs=inv(A'*A)*A'*y;
yr=coefs(1)*xprim+coefs(2);
subplot(3,3,9);plot(xprim,yr);title('Regresion linear FISHER');
%Fisher siempre es mejor para realizar este tipo de practicas.