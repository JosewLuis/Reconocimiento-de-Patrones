clear all, close all, clc
%Ejercicio 1:
rand('seed',0); %Semillas.
randn('seed',0);
M=2;                        %Numero de clases.
N=2000;                     %Numero de patrones.
x1=randnorm([0,0]',[1,0.8;0.8,2],1000);     %Creamos x1 a partid de su media y su covarianza.
y1=zeros(1,1000);           %La clasificamos como tipo 1.
y1=y1+1;
x2=randnorm([3,3]',[1,-0.9;-0.9,2],1000);   %Creamos x2 a partid de su media y su covarianza.
x3=[x1,x2];                 %Creamos una matriz que es la concatenacion de ambas.
y3=[y1,y1+1];
[x,y]=shuffle(x3,y3);       %La desordenamos aleatoriamente, obteniendo asi un resultado distinto cada ejecucion.

%a:
m=[meanpat(x1(:,1:800)),meanpat(x2(:,1:800))];    %Medias con 800 valores.
%Clasificacion usando la distancia Euclidea:
for i=1:M,    
    d(i,:)=d_euclid(x,m(:,i));  %Calculo de distancia euclidea.
end
[~,yest]=min(d);
result1=100*sum(y==yest)/N;    %Resultado final distancia euclidea.

%b:
clear all, close all, clc
rand('seed',0); %Semillas.
randn('seed',0);
M=2;                        %Numero de clases.
N=2000;                     %Numero de patrones.
x1=randnorm([0,0],[1,0.8;0.8,2],1000);     %Creamos x1 a partid de su media y su covarianza.
y1=zeros(1,1000);           %La clasificamos como tipo 0.
y1=y1+1;
x2=randnorm([3,3],[1,-0.9;-0.9,2],1000);   %Creamos x2 a partid de su media y su covarianza.
x3=[x1,x2];                 %Creamos una matriz que es la concatenacion de ambas.
y3=[y1,y1+1];
[x,y]=shuffle(x3,y3);       %La desordenamos aleatoriamente, obteniendo asi un resultado distinto cada ejecucion.

%Recalculamos todo empleando celdas, ya que me resulta mas comodo para este
%metodo:
for i=1:M,
    ind=find(y==i);
    m{i}=meanpat(x(:,ind));
    c{i}=covpat(x(:,ind));
end
%Clasificacion usando la distancia de Mahalanobis:
for i=1:M,
    d(i,:)=d_mahal(x,m{i},c{i});
end,
[~,yest]=min(d);              
result2=100*sum(y==yest)/N;    %Resultado final distancia Mahalanobis.