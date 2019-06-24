clear all
close all

load iris

valoresK = 1:10;
for ind=1:length(valoresK),
  K = valoresK(ind);
  for i=1:length(y)   
    p = x(:,i);    
    d = d_euclid(x,p);
    [d2,pos] = sort(d);   
    clase = y(pos(1));
    clase_est = moda(y(pos(2:K+1)));
    error(i) = (clase~=clase_est);           
  end
  tasa_acierto(ind) = (1-sum(error)/length(error))*100;
end

plot(valoresK,tasa_acierto,'-o');
title('Tasa de acierto knn en la B.D. iris en funcion de K')
xlabel('K')
ylabel('Tasa de acierto')