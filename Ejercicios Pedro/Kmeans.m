clear all
close all
rand('seed',0);

x = rand(2,100000);
ind = find((sum(x.^2)<1)& (sum(x.^2)>0.2) );
x=x(:,ind);

K=7;
centroides = x(:,1:K);

for i=1:50,
    
    plot(x(1,:),x(2,:),'.g');axis equal;hold on;
    plot(centroides(1,:),centroides(2,:),'.b','MarkerSize',30);hold
    
    for j=1:K,
      d(j,:) = d_euclid(x,centroides(:,j));
    end
    [~,clase]=min(d);
            
    for j=1:K,
      ind = find(clase==j);
      centroides(:,j)=meanpat(x(:,ind));
    end
                
end
hold on;
color=['rgbkymc'];
for i=1:7,
    ind = find(clase==i);
    plot(x(1,ind),x(2,ind),['.' color(i)]);
end
plot(centroides(1,:),centroides(2,:),'.b','MarkerSize',30);