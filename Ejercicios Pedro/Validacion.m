close all
clear all
clc

rand('seed',0);
randn('seed',0);

x=[0 1 2 3];
y=[-2 3 -5 -4];

ruido = 0.15;
N = 30;

p=polyfit(x,y,3);

xi=0:0.1:3.5;
plot(xi,polyval(p,xi));

x = rand(1,N)*3;
y = polyval(p,x) + ruido*randn(1,length(x));

plot(x,y,'o')

xg = rand(1,2000000)*3.5;
yg = polyval(p,xg);
drawnow;

% Hasta aqui hemos generado los datos con los que trabajaremos

xi = 0:0.1:3.5;

for orden=1:6
      
  % Estimacion de parametros : APRENDIZAJE
  p = polyfit(x,y,orden);
  
  % Calculo del error de generalizacion
  yestim = polyval(p,xg);
  Eg(orden) = sum((yg-yestim).^2)/length(xg);

  % Error de resustitucion
  yestim = polyval(p,x);
  Er(orden) = sum((y-yestim).^2)/length(x);
  
  % Error de validacion simple
  xtrn = x(1:length(x)/2);
  ytrn = y(1:length(x)/2);
  xtst = x(length(x)/2+1:end);
  ytst = y(length(x)/2+1:end);
  
  p = polyfit(xtrn,ytrn,orden);

  yestim = polyval(p,xtst);
  Ev(orden) = sum((ytst-yestim).^2)/length(xtst);

  % Random sampling
  Ers(orden)=0;
  for j=1:100
    [x,y]=shuffle(x,y);
    xtrn = x(1:length(x)/2);
    ytrn = y(1:length(x)/2);
    xtst = x(length(x)/2+1:end);
    ytst = y(length(x)/2+1:end);
  
    p = polyfit(xtrn,ytrn,orden);

    yestim = polyval(p,xtst);
    Ers(orden) = Ers(orden) + sum((ytst-yestim).^2)/length(xtst);
  end
  Ers(orden) = Ers(orden)/100;
  
end

plot(Eg,'r');hold on;plot(Er,'b'); plot(Ev,'m');plot(Ers,'k')
legend('Egeneral','Eresust','Evalid','Erandomsampl')