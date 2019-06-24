clear, close, clc
%Algoritmo k-nn.
load iris;
y=y+1;
%Combinaciones 2 caracteristicas:
xk{1}=[x(1,:);x(2,:)];
xk{2}=[x(1,:);x(3,:)];
xk{3}=[x(1,:);x(4,:)];
xk{4}=[x(2,:);x(3,:)];
xk{5}=[x(2,:);x(4,:)];
xk{6}=[x(3,:);x(4,:)];
figure;
K=1:10;
for t=1:6 %Numero xk.
    for i=1:length(K) %Numero k.
        Kvalue=i;
        for j=1:length(y)   %Por cada valor.
            p=xk{t}(:,j);
            d=d_euclid(xk{t},p);
            [~,pos]=sort(d);
            clase=y(pos(1));
            clase_est=moda(y(pos(2:Kvalue+1)));
            error(j)=(clase~=clase_est);
        end
        tasa_acierto{t}(i)=(1-sum(error)/length(error))*100;
    end
end
color=['rgybmc'];
subplot(2,1,1);
for i=1:6
   plot(tasa_acierto{i},color(i)),hold on;
end
xlabel('K value');
ylabel('% acierto');
legend('1ra y 2da','1ra y 3ra','1ra y 4ta','2da y 3ra', '2da y 4ta','3ra y 4ta');
hold off;

clear xk;
%Con 3 caracteristicas:
xk{1}=[x(1,:);x(2,:);x(3,:)];
xk{2}=[x(1,:);x(2,:);x(4,:)];
xk{3}=[x(2,:);x(3,:);x(4,:)];

K=1:6;
for t=1:3 %Numero xs.
    for i=1:length(K) %Numero k.
        Kvalue=i;
        for j=1:length(y)   %Por cada valor.
            p=xk{t}(:,j);
            d=d_euclid(xk{t},p);
            [d2,pos]=sort(d);
            clase=y(pos(1));
            clase_est=moda(y(pos(2:Kvalue+1)));
            error(j)=(clase~=clase_est);
        end
        tasa_acierto{t}(i)=(1-sum(error)/length(error))*100;
    end
end
color=['rgy'];
subplot(2,2,3);
for i=1:3
   plot(tasa_acierto{i},color(i)),hold on;
end
axis([1 6 70 100]);
xlabel('K value');
ylabel('% acierto');
legend('1ra, 2da y 3ra','1ra, 2da y 3ra','2da, 3ra y 4ta');
hold off;

%Con las 4 caracteristicas:
clear tasa_acierto;
for i=1:length(K) %Numero k.
    Kvalue=i;
    for j=1:length(y)   %Por cada valor.
        p=x(:,j);
        d=d_euclid(x,p);
        [d2,pos]=sort(d);
        clase=y(pos(1));
        clase_est=moda(y(pos(2:Kvalue+1)));
        error(j)=(clase~=clase_est);
    end
    tasa_acierto(i)=(1-sum(error)/length(error))*100;
end
subplot(2,2,4);
plot(tasa_acierto,'m');
axis([1 6 90 100]);
xlabel('K value');
ylabel('% acierto');
legend('1ra, 2da, 3ra y 4ta');
hold off;