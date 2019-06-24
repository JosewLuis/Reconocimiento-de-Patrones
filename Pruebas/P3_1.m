[x,y]=meshgrid(0.5:0.1:0,0.5:0.1:0);
z=(sin(1/2*x.^2-1/4*y.^2+3)*cos(2*x+1+eps*y));

while(1),
    close all;
    pcolor(x,y,z),shading flat;hold on;
    sol=ginput(1)';
    for i=1:100,
       x=sol(1,i);
       y=sol(2,i);
       dx=x*cos(x^2/2 - y^2/4 + 3)*cos(2*x + y/4503599627370496 + 1) - 2*sin(x^2/2 - y^2/4 + 3)*sin(2*x + y/4503599627370496 + 1);
       dy=-(sin(x^2/2 - y^2/4 + 3)*sin(2*x + y/4503599627370496 + 1))/4503599627370496 - (y*cos(x^2/2 - y^2/4 + 3)*cos(2*x + y/4503599627370496 + 1))/2;
       sol(:,i+1)=sol(:,i)-0.1*[dx;dy];
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
       pause
    end;
end;
