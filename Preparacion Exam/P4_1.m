clear, close, clc
load iris;
y=y+1;

%2 caracteristicas:
xk=[x(1,:);x(4,:)];
K=2;
centroides = x(:,1:K);

for i=1:50
    plot(xk(1,:),xk(2,:),'.g');axis equal;hold on;
    plot(centroides(1,:),centroides(2,:),'.b','MarkerSize',30);hold
    for j=1:K
      d(j,:)=d_euclid(x,centroides(:,j));
    end
    [~,clase]=min(d);  
    for j=1:K
      ind=find(clase==j);
      centroides(:,j)=meanpat(x(:,ind));
    end   
end
hold on;
color=['rgk'];
for i=1:2
    ind=find(clase==i);
    plot(xk(1,ind),xk(2,ind),['.' color(i)]);
end
