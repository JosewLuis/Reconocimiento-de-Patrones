clc, close all, clear all
load iris
y=y+1;

for i=1:max(y)    
    m(:,i) = meanpat(x(:,find(y==i)));
    C{i}   = covpat(x(:,find(y==i)));
    Pw(i)  = length(find(y==i));
end
Pw = Pw/sum(Pw);

for k=1:length(y)
  xi = x(:,k);

  PXcw1=mvnpdf(xi',m(:,1)',C{1});
  PXcw2=mvnpdf(xi',m(:,2)',C{2});
  PXcw3=mvnpdf(xi',m(:,3)',C{3});

  [basura,clase(k)] = max([Pw(1)*PXcw1 Pw(2)*PXcw2 Pw(3)*PXcw3]);
end