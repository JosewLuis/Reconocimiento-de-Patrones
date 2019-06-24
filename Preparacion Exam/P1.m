clear, close, clc
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
%Ajuste lineal.
figure,plot(x,y,'r.'),hold on; 
axis([60 100 30 90]);
A=[x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=60:100;
yr=coefs(1)*xr+coefs(2);
plot(xr,yr,'b'),hold on;
%Lets make a prediction.
y=coefs(1)*88+coefs(2);
plot(88,y,'k.'),hold off,title('Ajuste lineal');

%Ajuste lineal sin un dato.
x=[90,86,89,81,75]';
y=[62,45,55,64,53]';
figure,plot(x,y,'r.'),hold on;
axis([60 100 30 90]);
A=[x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=60:100;
yr=coefs(1)*xr+coefs(2);
plot(xr,yr,'b'),hold off, title('Ajuste lineal sin 1 dato');

%Ajuste exponencial.
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
figure,plot(x,y,'r.'),hold on;
axis([60 100 30 90]);
A=[x.^2, x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=60:100;
yr=coefs(1)*xr.^2+coefs(2)*xr+coefs(3);
plot(xr,yr,'b'),hold off, title('Ajuste exponencial');

%^3.
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
figure,plot(x,y,'r.'),hold on;
axis([60 100 30 90]);
A=[x.^3, x.^2, x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=60:100;
yr=coefs(1)*xr.^3+coefs(2)*xr.^2+coefs(3)*xr+coefs(4);
plot(xr,yr,'b'),hold off, title('Ajuste ^3');

%y=1./(y.*y)
%y=a*exp(-b * x)
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
y=y./(y.*y);
ys=log(y);
figure,plot(x,y,'r.'),hold on;
A=[x,ones(size(x))];
coefs=inv(A'*A)*A'*ys;
B=coefs(1);
A=exp(coefs(2));
xr=60:100;
yr=A*exp(B*xr);
plot(xr,yr,'b'),hold off,title('Ajuste examen');

%x2=x/100; y2=3*x2.*exp(2*x2)
x=[90,86,67,89,81,75]';
y=[62,45,40,55,64,53]';
x2=x/100;
y2=3*x2.*exp(2*x2);
figure,plot(x2,y2,'r.'),hold on;
axis([-10 10 -10 100]);
ys=log(y2./x2);
A=[x2,ones(size(x2))];
coefs=inv(A'*A)*A'*ys;
A=coefs(1);
B=exp(coefs(2));
xr=0:100;
yr=A*xr+exp(B*xr);
plot(xr,yr,'k'),hold off;
