clear, close, clc

%1:
%a.
rand('seed',0);
x=fix(rand(1,30)*100);

%b.
j=1;
for i=0:10:90
    c1=(i<=x);
    c2=(i+9>=x);
    conjunto(j)=length(x(c1&c2));
    j=j+1;
end
sum(conjunto)

%c.
figure,hist(x);    %Histograma de x.
[a,b]=hist(x);
a=hist(x,5:10:95);
[a,b]=hist(x,5:10:95);

%d.
%Los maximos y minimos valores.

%e.
%El numero total de elementos: 30.

%f.
%Probabilidaes:
probabilidad=(conjunto.*100)/30;

%g.
sum(probabilidad)

%h.
x1=fix(rand(1,1000)*100);
x2=fix(rand(1,100000)*100);
figure;
subplot(1,2,1),hist(x1);
subplot(1,2,2),hist(x2);

clear, close, clc

%2:
%a.
randn('seed',0);
rand('seed',0);
X=rand(1,100000);
Y=randn(1,100000);

figure;
subplot(1,2,1),hist(X),title('random binary');
subplot(1,2,2),hist(Y),title('random normal');
%Medias.
Xmean=mean(X);
Ymean=mean(Y);
%Desviaciones.
Xstd=std(X);
Ystd=std(Y);
%Rangos.
Xrange=max(X)-min(X);
Yrange=max(Y)-min(Y);
%Max bin.
[a,b]=hist(X);
XmaxBin=round(max(b));
[a,b]=hist(Y);
YmaxBin=round(max(b));

%d.
%[m-s,m+s], [m-2s,m+2s], [m-3s,m+3s].
c1=(Ymean-Ystd<=Y);
c2=(Y<=Ymean+Ystd);
Inter(1)=length(Y(c1&c2));

c1=(Ymean-2*Ystd<=Y);
c2=(Y<=Ymean+2*Ystd);
Inter(2)=length(Y(c1&c2));

c1=(Ymean-3*Ystd<=Y);
c2=(Y<=Ymean+3*Ystd);
Inter(3)=length(Y(c1&c2));
