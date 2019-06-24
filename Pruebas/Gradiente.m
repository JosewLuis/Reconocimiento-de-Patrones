[x,y]=meshgrid(-3:0.1:3,-4:0.1:4);
z = (x.^4 - 3*x.^2 + x + y.*y + x.*y);
while(1),
    close all
    pcolor(x,y,z),shading flat;hold on;
    sol = ginput(1)';
    for i=1:100,
       x=sol(1,i);
       y=sol(2,i);
       dx = 4 * x.^3 - 6*x + 1 + y;
       dy = 2 * y + x;
       sol(:,i+1) = sol(:,i) - 0.1 * [dx;dy];
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
       pause
    end;
end;
