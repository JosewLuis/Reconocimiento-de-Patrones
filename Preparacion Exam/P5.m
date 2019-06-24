clear, close, clc

rand('seed',0);
randn('seed',0);
x=rand(1,100);
y=exp(x.^3-x.^2+0.01*x+2)+0.04*randn(size(x));
x=x';   y=y';
figure;

%Polonomial degree 1.
A=[x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=0:0.1:1;
yr=coefs(1)*xr+coefs(2);
subplot(2,3,1);
plot(x,y,'ko'),hold on;
plot(xr,yr,'r'),title('Polinomial degree 1'), hold off;
%Simple validation.
xtrn=x(1:70);
ytrn=y(1:70);
xtst=x(70:100);
ytst=y(70:100);
A=[xtrn, ones(size(xtrn))];
coefs=inv(A'*A)*A'*ytrn;
yest=coefs(1)*xtst+coefs(2);
SimpleError(1)=sum((ytst-yest).^2)/length(xtst);
%Random sampling.
RandomError(1)=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
  
    A=[xtrn,ones(size(xtrn))];
    coefs=inv(A'*A)*A'*ytrn;

    yest=coefs(1)*xtst+coefs(2);
    RandomError(1)=RandomError(1)+sum((ytst-yest).^2)/length(xtst);
end
RandomError(1)=RandomError(1)/100;

%Polinomial degree 2.
A=[x.^2, x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=0:0.1:1;
yr=coefs(1)*xr.^2+coefs(2)*xr+coefs(3);
subplot(2,3,2);
plot(x,y,'ko'),hold on;
plot(xr,yr,'r'),title('Polinomial degree 2'), hold off;
%Simple validation.
xtrn=x(1:70);
ytrn=y(1:70);
xtst=x(70:100);
ytst=y(70:100);
A=[xtrn.^2, xtrn, ones(size(xtrn))];
coefs=inv(A'*A)*A'*ytrn;
yest=coefs(1)*xtst.^2+coefs(2)*xtst+coefs(3);
SimpleError(2)=sum((ytst-yest).^2)/length(xtst);
%Random Sampling.
RandomError(2)=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
  
    A=[xtrn.^2, xtrn, ones(size(xtrn))];
    coefs=inv(A'*A)*A'*ytrn;

    yest=coefs(1)*xtst.^2+coefs(2)*xtst+coefs(3);
    RandomError(2)=RandomError(2)+sum((ytst-yest).^2)/length(xtst);
end
RandomError(2)=RandomError(2)/100;

%Polinomial degree 3.
A=[x.^3, x.^2, x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=0:0.1:1;
yr=coefs(1)*xr.^3+coefs(2)*xr.^2+coefs(3)*xr+coefs(4);
subplot(2,3,3);
plot(x,y,'ko'),hold on;
plot(xr,yr,'r'),title('Polinomial degree 3'), hold off;
%Simple validation.
xtrn=x(1:70);
ytrn=y(1:70);
xtst=x(70:100);
ytst=y(70:100);
A=[xtrn.^3, xtrn.^2, xtrn, ones(size(xtrn))];
coefs=inv(A'*A)*A'*ytrn;
yest=coefs(1)*xtst.^3+coefs(2)*xtst.^2+coefs(3)*xtst+coefs(4);
SimpleError(3)=sum((ytst-yest).^2)/length(xtst);
%Random Sampling.
RandomError(3)=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
  
    A=[xtrn.^3, xtrn.^2, xtrn, ones(size(xtrn))];
    coefs=inv(A'*A)*A'*ytrn;

    yest=coefs(1)*xtst.^3+coefs(2)*xtst.^2+coefs(3)*xtst+coefs(4);
    RandomError(3)=RandomError(3)+sum((ytst-yest).^2)/length(xtst);
end
RandomError(3)=RandomError(3)/100;

%A linear model as y=a+bx+cx2+dx3+e*sin(x).
A=[sin(x), x.^3, x.^2, x, ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=0:0.1:1;
yr=coefs(1)*sin(xr)+coefs(2)*xr.^3+coefs(3)*xr.^2+coefs(4)*xr+coefs(5);
subplot(2,2,3);
plot(x,y,'ko'),hold on;
plot(xr,yr,'r'),title('Model y=a+bx+cx2+dx3+e*sin(x)'), hold off;
%Simple validation.
xtrn=x(1:70);
ytrn=y(1:70);
xtst=x(70:100);
ytst=y(70:100);
A=[sin(xtrn), xtrn.^3, xtrn.^2, xtrn, ones(size(xtrn))];
coefs=inv(A'*A)*A'*ytrn;
yest=coefs(1)*sin(xtst)+coefs(2)*xtst.^3+coefs(3)*xtst.^2+coefs(4)*xtst+coefs(5);
SimpleError(4)=sum((ytst-yest).^2)/length(xtst);
%Random Sampling.
RandomError(4)=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
  
    A=[sin(xtrn), xtrn.^3, xtrn.^2, xtrn, ones(size(xtrn))];
    coefs=inv(A'*A)*A'*ytrn;

    yest=coefs(1)*sin(xtst)+coefs(2)*xtst.^3+coefs(3)*xtst.^2+coefs(4)*xtst+coefs(5);
    RandomError(4)=RandomError(4)+sum((ytst-yest).^2)/length(xtst);
end
RandomError(4)=RandomError(4)/100;

%A linear model as y=a+bx+cx2+dx3+e*sin(x)+f*sin(x).
A=[ones(size(x)),x,x.^2,x.^3,sin(x),sin(x)];
coefs=pinv(A)*y;
xr=[0:0.01:1];
yr=coefs(1)+coefs(2)*xr+coefs(3)*xr.^2+coefs(4)*xr.^3+coefs(5)*sin(xr)+coefs(6)*sin(xr);
subplot(2,2,4);
plot(x,y,'ko'),hold on;
plot(xr,yr,'r'),title('Model y=a+bx+cx2+dx3+e*sin(x)+f*sin(x)'), hold off;
%Simple validation.
xtrn=x(1:70);
ytrn=y(1:70);
xtst=x(70:100);
ytst=y(70:100);
A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn),sin(xtrn)];
coefs=inv(A'*A)*A'*ytrn;
yest=coefs(1)+coefs(2)*xtst+coefs(3)*xtst.^2+coefs(4)*xtst.^3+coefs(5)*sin(xtst)+coefs(6)*sin(xtst);
SimpleError(5)=sum((ytst-yest).^2)/length(xtst);
%Random Sampling.
RandomError(5)=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
  
    A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn),sin(xtrn)];
    coefs=inv(A'*A)*A'*ytrn;

    yest=coefs(1)+coefs(2)*xtst+coefs(3)*xtst.^2+coefs(4)*xtst.^3+coefs(5)*sin(xtst)+coefs(6)*sin(xtst);
    RandomError(5)=RandomError(5)+sum((ytst-yest).^2)/length(xtst);
end
RandomError(5)=RandomError(5)/100;

%Print error.
figure;
subplot(1,2,1),plot(SimpleError,'mo-'),title('Simple validation');
subplot(1,2,2),plot(RandomError,'mo-'),title('Random validation');