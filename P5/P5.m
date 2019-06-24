clear all, close all, clc
load iris;
y=y+1;
figure;
%Ejercicio 1:
%a:
x1=x(1:4:600); 
x2=x(2:4:600);
xk{1}=[x1;x2];

x1=x(1:4:600);
x2=x(3:4:600);
xk{2}=[x1;x2];

x1=x(1:4:600);
x2=x(4:4:600);
xk{3}=[x1;x2];

x1=x(2:4:600);
x2=x(3:4:600);
xk{4}=[x1;x2];

x1=x(2:4:600);
x2=x(4:4:600);
xk{5}=[x1;x2];

x1=x(3:4:600);
x2=x(4:4:600);
xk{6}=[x1;x2];


maxK=1:10;    %Usaremos un maximo de k=10.
for t=1:6,
    for i=1:length(maxK),
        K=maxK(i);
        for j=1:length(y),
            p=xk{t}(:,j);    
            d=d_euclid(xk{t},p);
            [d2,pos]=sort(d);   
            clase=y(pos(1));
            clase_est=moda(y(pos(2:K+1)));
            error(j)=(clase~=clase_est); 
        end,
        tasa_acierto{t}(i)=(1-sum(error)/length(error))*100;
    end,
end,

color=['rgybmc'];
subplot(2,2,1);hold on;
for i=1:6,
    plot(tasa_acierto{i},color(i));hold on;
end,
xlabel('K');
ylabel('Tasa de acierto');
legend('1ra y 2da.','1ra y 3ra.','1ra y 4ta.','2da y 3ra.','2da y 4ta.','3ra y 4ta.');
hold off;


%b:
x1=x(1:4:600); 
x2=x(2:4:600);
x3=x(3:4:600);
xk{1}=[x1;x2;x3];

x1=x(1:4:600); 
x2=x(2:4:600);
x3=x(4:4:600);
xk{2}=[x1;x2;x3];

x1=x(2:4:600); 
x2=x(3:4:600);
x3=x(4:4:600);
xk{3}=[x1;x2;x3];

for t=1:3,
    for i=1:length(maxK),
        K=maxK(i);
        for j=1:length(y),
            p=xk{t}(:,j);    
            d=d_euclid(xk{t},p);
            [d2,pos]=sort(d);   
            clase=y(pos(1));
            clase_est=moda(y(pos(2:K+1)));
            error(j)=(clase~=clase_est); 
        end,
        tasa_acierto{t}(i)=(1-sum(error)/length(error))*100;
    end,
end,

color=['bmc'];
subplot(2,2,2);hold on;
for i=1:3,
    plot(tasa_acierto{i},color(i));hold on;
end,
xlabel('K');
ylabel('Tasa de acierto');
legend('1ra,2da y 3ra.','1ra,2da y 4ta.','2da,3ra y 4ta.');
hold off;
hold off;

%c:
clear tasa_acierto;
for i=1:length(maxK),
  K=maxK(i);
  for j=1:length(y)   
    p=x(:,j);    
    d=d_euclid(x,p);
    [d2,pos]=sort(d);   
    clase=y(pos(1));
    clase_est=moda(y(pos(2:K+1)));
    error(j)=(clase~=clase_est);           
  end
  tasa_acierto(i)=(1-sum(error)/length(error))*100;
end

subplot(2,1,2);
plot(tasa_acierto,'m');hold on;
xlabel('K');
ylabel('Tasa de acierto');
legend('Las 4 caracteristicas.');
