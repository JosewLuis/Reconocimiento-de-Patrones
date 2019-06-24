close all, clear all, clc
rand('seed',0);
randn('seed',0);
x=rand(1,100)';
y=exp(x.^3-x.^2+0.01*x+2)+0.04*randn(size(x));
%a:
A=[x,ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=[0:0.001:1];
yr=coefs(1)*xr+coefs(2);
subplot(2,3,1);
plot(x,y,'g.');hold on;
plot(xr,yr,'m');
title("Ecuacion de primer grado");hold off;
axis([0 1 6 8]);

%Validacion del modelo:
x1=rand(1,1000)';
y1=exp(x1.^3-x1.^2+0.01*x1+2)+0.04*randn(size(x1));
%Simple:
[x1,y1]=shuffle(x1,y1);
xtrn=x1(1:700);
ytrn=y1(1:700);
xtst=x1(700:1000);
ytst=y1(700:1000);
p=polyfit(xtrn,ytrn,1);
yestim=polyval(p,xtst);
Ev{1}=sum((ytst-yestim).^2)/length(xtst);
%Validacion cruzada:
Ers=0;
for j=0:9,
    if j==0,
        xtrn=x(1:10);
        ytrn=y(1:10);
        xtst=x(11:100);
        ytst=y(11:100);
    end
    if j==9,
        xtrn=x(90:100);
        ytrn=y(90:100);
        xtst=x(1:89);
        ytst=y(1:89);
    end
    if j~=0 && j~=9
        xtrn=x(10*j:(10*j)+10);
        ytrn=y(10*j:(10*j)+10);
        xtst=x(1:10*j+1);x(10*j+11:100);
        ytst=y(1:10*j+1);y(10*j+11:100);
    end
    p=polyfit(xtrn,ytrn,1);
    yestim=polyval(p,xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
%No veo la manera de realizar la iteracion S+1.
VC{1}=Ers/10;
%Random sampling:
Ers=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
    p=polyfit(xtrn,ytrn,1);
    yestim=polyval(p,xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
RS{1}=Ers/100;

%b:
A=[x.^2,x,ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=[0:0.001:1];
yr=coefs(1)*xr.^2+coefs(2)*xr+coefs(3);
subplot(2,3,2);
plot(x,y,'g.');hold on;
plot(xr,yr,'m');
title("Ecuacion de segundo grado");hold off;
axis([0 1 6 8]);
%Validacion del modelo:
%Validacion simple:
[x1,y1]=shuffle(x1,y1);
xtrn=x1(1:700);
ytrn=y1(1:700);
xtst=x1(700:1000);
ytst=y1(700:1000);
p=polyfit(xtrn,ytrn,2);
yestim=polyval(p,xtst);
Ev{2}=sum((ytst-yestim).^2)/length(xtst);
%Validacion cruzada:
Ers=0;
for j=0:9,
    if j==0,
        xtrn=x(1:10);
        ytrn=y(1:10);
        xtst=x(11:100);
        ytst=y(11:100);
    end
    if j==9,
        xtrn=x(90:100);
        ytrn=y(90:100);
        xtst=x(1:89);
        ytst=y(1:89);
    end
    if j~=0 && j~=9
        xtrn=x(10*j:(10*j)+10);
        ytrn=y(10*j:(10*j)+10);
        xtst=x(1:10*j+1);x(10*j+11:100);
        ytst=y(1:10*j+1);y(10*j+11:100);
    end
    p=polyfit(xtrn,ytrn,2);
    yestim=polyval(p,xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
%No veo la manera de realizar la iteracion S+1.
VC{2}=Ers/10;
%Random sampling:
Ers=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
    p=polyfit(xtrn,ytrn,2);
    yestim=polyval(p,xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
RS{2}=Ers/100;

%c:
A=[x.^3,x.^2,x,ones(size(x))];
coefs=inv(A'*A)*A'*y;
xr=[0:0.001:1];
yr=coefs(1)*xr.^3+coefs(2)*xr.^2+coefs(3)*xr+coefs(4);
subplot(2,3,3);
plot(x,y,'g.');hold on;
plot(xr,yr,'m');
title("Ecuacion de tercer grado");hold off;
axis([0 1 6 8]);
%Validacion del modelo:
%Validacion simple:
[x1,y1]=shuffle(x1,y1);
xtrn=x1(1:700);
ytrn=y1(1:700);
xtst=x1(700:1000);
ytst=y1(700:1000);
p=polyfit(xtrn,ytrn,3);
yestim=polyval(p,xtst);
Ev{3}=sum((ytst-yestim).^2)/length(xtst);
%Validacion cruzada:
Ers=0;
for j=0:9,
    if j==0,
        xtrn=x(1:10);
        ytrn=y(1:10);
        xtst=x(11:100);
        ytst=y(11:100);
    end
    if j==9,
        xtrn=x(90:100);
        ytrn=y(90:100);
        xtst=x(1:89);
        ytst=y(1:89);
    end
    if j~=0 && j~=9
        xtrn=x(10*j:(10*j)+10);
        ytrn=y(10*j:(10*j)+10);
        xtst=x(1:10*j+1);x(10*j+11:100);
        ytst=y(1:10*j+1);y(10*j+11:100);
    end
    p=polyfit(xtrn,ytrn,3);
    yestim=polyval(p,xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
%No veo la manera de realizar la iteracion S+1.
VC{3}=Ers/10;
%Random sampling:
Ers=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
    p=polyfit(xtrn,ytrn,3);
    yestim=polyval(p,xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
RS{3}=Ers/100;

%d:
A=[ones(size(x)),x,x.^2,x.^3,sin(x)];
coefs=pinv(A)*y;
xr=[0:0.01:1];
yr=coefs(1)+coefs(2)*xr+coefs(3)*xr.^2+coefs(4)*xr.^3+coefs(5)*sin(xr);
subplot(2,3,4);
plot(x,y,'g.');hold on;
plot(xr,yr,'m');
title("Ecuacion de tercer grado y seno");hold off;
axis([0 1 6 8]);
%Validacion del modelo:
%Validacion simple:
[x1,y1]=shuffle(x1,y1);
xtrn=x1(1:700);
ytrn=y1(1:700);
xtst=x1(700:1000);
ytst=y1(700:1000);
A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn)];
p=inv(A'*A)*A'*ytrn;
yestim=p(1)+p(2)*xtst+p(3)*xtst.^2+p(4)*xtst.^3+p(5)*sin(xtst);
Ev{4}=sum((ytst-yestim).^2)/length(xtst);
%Validacion cruzada:
Ers=0;
for j=0:9,
    if j==0,
        xtrn=x(1:10);
        ytrn=y(1:10);
        xtst=x(11:100);
        ytst=y(11:100);
    end
    if j==9,
        xtrn=x(90:100);
        ytrn=y(90:100);
        xtst=x(1:89);
        ytst=y(1:89);
    end
    if j~=0 && j~=9
        xtrn=x(10*j:(10*j)+10);
        ytrn=y(10*j:(10*j)+10);
        xtst=x(1:10*j+1);x(10*j+11:100);
        ytst=y(1:10*j+1);y(10*j+11:100);
    end
    A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn)];
    p=inv(A'*A)*A'*ytrn;
    yestim=p(1)+p(2)*xtst+p(3)*xtst.^2+p(4)*xtst.^3+p(5)*sin(xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
%No veo la manera de realizar la iteracion S+1.
VC{4}=Ers/10;
%Random sampling:
Ers=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x(length(x)/2+1:end);
    ytst=y(length(x)/2+1:end);
    A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn)];
    p=inv(A'*A)*A'*ytrn;
    yestim=p(1)+p(2)*xtst+p(3)*xtst.^2+p(4)*xtst.^3+p(5)*sin(xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
RS{4}=Ers/100;

%e:
A=[ones(size(x)),x,x.^2,x.^3,sin(x),sin(x)];
coefs=pinv(A)*y;
xr=[0:0.01:1];
yr=coefs(1)+coefs(2)*xr+coefs(3)*xr.^2+coefs(4)*xr.^3+coefs(5)*sin(xr)+coefs(6)*sin(xr);
subplot(2,3,6);
plot(x,y,'g.');hold on;
plot(xr,yr,'m');
title("Ecuacion de tercer grado y seno+seno");hold off;
axis([0 1 6 8]);
%Validacion del modelo:
%Validacion simple:
[x1,y1]=shuffle(x1,y1);
xtrn=x1(1:700);
ytrn=y1(1:700);
xtst=x1(701:1000);
ytst=y1(701:1000);
A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn),sin(xtrn)];
p=pinv(A)*ytrn;
yestim=p(1)+p(2)*xtst+p(3)*xtst.^2+p(4)*xtst.^3+p(5)*sin(xtst)+p(6)*sin(xtst);
Ev{5}=sum((ytst-yestim).^2)/length(xtst);
%Validacion cruzada:
Ers=0;
for j=0:9,
    if j==0,
        xtrn=x(1:10);
        ytrn=y(1:10);
        xtst=x(11:100);
        ytst=y(11:100);
    end
    if j==9,
        xtrn=x(90:100);
        ytrn=y(90:100);
        xtst=x(1:89);
        ytst=y(1:89);
    end
    if j~=0 && j~=9
        xtrn=x(10*j:(10*j)+10);
        ytrn=y(10*j:(10*j)+10);
        xtst=x(1:10*j+1);x(10*j+11:100);
        ytst=y(1:10*j+1);y(10*j+11:100);
    end
    A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn),sin(xtrn)];
    p=pinv(A)*ytrn;
    yestim=p(1)+p(2)*xtst+p(3)*xtst.^2+p(4)*xtst.^3+p(5)*sin(xtst)+p(6)*sin(xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
%No veo la manera de realizar la iteracion S+1.
VC{5}=Ers/10;
%Random sampling:
Ers=0;
for j=1:100
    [x,y]=shuffle(x,y);
    xtrn=x(1:length(x)/2);
    ytrn=y(1:length(x)/2);
    xtst=x((length(x)/2)+1:end);
    ytst=y((length(x)/2)+1:end);
    A=[ones(size(xtrn)),xtrn,xtrn.^2,xtrn.^3,sin(xtrn),sin(xtrn)];
    p=pinv(A)*ytrn;
    yestim=p(1)+p(2)*xtst+p(3)*xtst.^2+p(4)*xtst.^3+p(5)*sin(xtst)+p(6)*sin(xtst);
    Ers=Ers+sum((ytst-yestim).^2)/length(xtst);
end
RS{5}=Ers/100;


