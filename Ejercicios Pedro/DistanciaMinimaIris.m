close all,clear all,clc
load iris
y=y+1;

N=length(y); % Numero de patrones
M=max(y);    % Numero de clases 

% Calculamos M prototipos
for i=1:M,
    ind=find(y==i);
    m{i}=meanpat(x(:,ind));
    C{i}=covpat(x(:,ind));
end

% Clasificacion usando la dist. euclidea
for i=1:M,    
  d(i,:)=d_euclid(x,m{i});  
end
[~,yest]=min(d);
100*sum(y==yest)/N

% Clasificacion usando la dist. Mahalanobis
for i=1:M,
  d(i,:)=d_mahal(x,m{i},C{i});
end
[~,yest]=min(d);
100*sum(y==yest)/N