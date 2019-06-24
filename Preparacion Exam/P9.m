close, clear, clc

%1.
figure;
%a.
rand('seed',0);
randn('seed',0);

%b.
x=randnorm([3,4],[1,0.8;0.8,1],1000);
subplot(1,3,1);plotpat(x);title('Original');

%c.
Xmean1=mean(x(1,:));
Xmean2=mean(x(2,:));

%d.
W=pca(x,2);

%e.
xprim=W*x;
subplot(2,3,2),plotpat(xprim),title('Reduccion')

%f.
x2=pinv(W)*xprim;
subplot(2,3,3),plotpat(x2),title('Reconstruccion')

%g.
m=meanpat(x);
x=subpat(x,m);

%h.
W=[-0.9,-0.9;0.9,-0.9];
xprim=W*x;
subplot(2,3,5),plotpat(xprim),title('Reduccion')
x2=pinv(W)*xprim;
subplot(2,3,6),plotpat(x2),title('Reconstruccion')

%2:
figure;
%a.
x1=randnorm([3,4]',[1,0.8;0.8,1],1000);
x2=randnorm([5,0]',[1,0.8;0.8,1],1000);
y=[zeros(size(x1(1,:))),ones(size(x2(1,:)))];
x=[x1,x2];
subplot(1,3,1),plotpat(x,y),title('Original');
m=meanpat(x);
x=subpat(x,m);

%b.
W=pca(x,1);
xprim=W*x;
Q=pinv(W);
xprimprim=Q*xprim;
subplot(1,3,2),plotpat(x,y),hold on;
plotpat(xprimprim,y),title('PCA'),hold off;

%c.
W=fisher(x,y,1);
xprim=W*x;
Q=pinv(W);
xprimprim=Q*xprim;
subplot(1,3,3),plotpat(x,y),hold on;
plotpat(xprimprim,y),title('FISHER'),hold off;