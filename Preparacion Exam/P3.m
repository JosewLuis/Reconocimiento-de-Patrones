clear, close, clc

rand('seed',0); %Semillas.
randn('seed',0);
n1=1000;
n2=1000;
x1=randnorm([0,0],[1,0.8; 0.8,2],n1);
x2=randnorm([3,3],[1,-0.9; -0.9,2],n2);
x1=[x1;zeros(size(x1(1,:)))];
x2=[x2;ones(size(x2(1,:)))];
x1(3,:)=x1(3,:)+1;
x2(3,:)=x2(3,:)+1;
x=[x1,x2];
x=shuffle(x);
X=x(:,1:1600);
%Distancia euclidea:
for i=1:2
    ind=find(X(3,:)==i);
    m(:,i)=meanpat(X(:,ind));
end

for i=1:2
    d(i,:)=d_euclid(x,m(:,i));
end
[~,yest]=min(d);
resultEuclid=100*sum(x(3,:)==yest)/length(x(3,:));

clear, close, clc

rand('seed',0); %Semillas.
randn('seed',0);
n1=1000;
n2=1000;
x1=randnorm([0,0],[1,0.8; 0.8,2],n1);
x2=randnorm([3,3],[1,-0.9; -0.9,2],n2);
x1=[x1;zeros(size(x1(1,:)))];
x2=[x2;ones(size(x2(1,:)))];
x1(3,:)=x1(3,:)+1;
x2(3,:)=x2(3,:)+1;
x=[x1,x2];
x=shuffle(x);
X=x(:,1:1600);

for i=1:2
   ind=find(X(3,:)==i);
   m(i,:)=meanpat(X(i,ind));
   c(i,:)=covpat(X(i,ind));
end

for i=1:2
   d(i,:)=d_mahal(x,m(i,:),c(i,:));
end
[~,yest]=min(d);
resultMahal=100*sum(x(3,:)==yest)/length(x(3,:));
