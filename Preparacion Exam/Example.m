close all,
x1=randnorm([8 10]',[2 1.8;1.8 2],1000);
x2=randnorm([11 10]',[2 1.8;1.8 2],1000);
y=[zeros(1,1000) ones(1,1000)];

x=[x1 x2];

m = meanpat(x);
x = subpat(x,m);

W = pca(x,1);
xprim = W*x;
Q = pinv(W);
xprimprim=Q*xprim;
figure,plotpat(x,y,'.'),axis equal, hold on,
plotpat(xprimprim,y),title('PCA');hold off

W = fisher(x,y,1);
xprim = W*x;
Q = pinv(W);
xprimprim=Q*xprim;
figure,plotpat(x,y,'.'),axis equal, hold on,
plotpat(xprimprim,y),title('FISHER');hold off