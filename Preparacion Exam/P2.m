clear, close, clc

%Ejercicio 1:
[x,y]=meshgrid(-1:0.1:1,-1:0.1:1);
z=sin(1/2*x.^2-1/4*y.^2+3)*cos(2*x+1+eps^y);

while(1)
    close all
    pcolor(x,y,z),shading flat;hold on;
    sol=ginput(1)';
    for i=1:100
       x=sol(1,i);
       y=sol(2,i);
       dx=x*cos(x^2/2-y^2/4 + 3)*cos(2*x+(1/4503599627370496)^y+1)-2*sin(x^2/2-y^2/4+3)*sin(2*x+(1/4503599627370496)^y+1);
       dy=(1/4503599627370496)^y*sin(x^2/2-y^2/4+3)*log(4503599627370496)*sin(2*x+(1/4503599627370496)^y+1)-(y*cos(x^2/2-y^2/4+3)*cos(2*x+(1/4503599627370496)^y+1))/2;
       sol(:,i+1)=sol(:,i)-0.1*[dx;dy];
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
       pause
    end
end

%Ejercicio 2:
[x,y]=meshgrid(-3:0.01:3,-4:0.01:4);
z=100*(x.^2-y.^2)+(1+x).^2;

while(1)
    close all
    pcolor(x,y,z),shading flat;hold on;
    sol=[10,10]';
    for i=1:100
       x=sol(1,i);
       y=sol(2,i);
       dx=202*x+2;
       dy=-200*y;
       dxx=202;
       dxy=0;
       dyy=-200;
       dyx=0;
       H=[dxx dxy;dyx dyy];                     
       sol(:,i+1)=sol(:,i)-0.1*inv(H)*([dx;dy]);       
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r')
       pause
    end
end
