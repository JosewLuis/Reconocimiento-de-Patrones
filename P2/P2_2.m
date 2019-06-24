%Ejercicio 2:
%b:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
coefs=polyfit(x,y,1);
xr=[40:100];
yr=polyval(coefs,xr);
plot(x,y,'r+');hold on;
plot(xr,yr,'b-');hold off;
axis([40 95 30 95]);

%f:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
coefs=polyfit(x,y,2);
xr=[40:100];
yr=polyval(coefs,xr);
plot(x,y,'r+');hold on;
plot(xr,yr,'b-');hold off;
axis([40 95 30 95]);

%g:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
plot(x,y,'x');hold on;
axis([40 95 30 95]);
coefs=polyfit(x,y,3);
xr=60:0.01:100;
yr=polyval(coefs,xr);
plot(xr,yr,'r-');hold off;

%h:
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
y=1./(y.*y);
ys=log(y);
coefs=polyfit(x,ys,1);
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
coefs=polyfit(x,ys,1);
A=coefs(1);
B=exp(coefs(2));
xr=[0:100];
yr=A*xr+exp(B*xr);
plot(x,y,'x');hold on;
axis([-10 10 -10 100]);
plot(xr,yr,'m-');hold off;

%En H e I, no logro realizar el ajuste polinomico, solo me sale el lineal y
%no encuentro una manera de solventarlo.



