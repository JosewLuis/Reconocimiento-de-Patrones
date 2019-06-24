%Ejercicio 1:
clear all,close all,clc
[x,y]=meshgrid(-1:0.1:1,-1:0.1:1);
z=sin(1/2*x.^2-1/4*y.^2+3)*cos(2*x+1+eps^y);
while(1),
    close all
    pcolor(x,y,z),shading flat;hold on;
    sol=[0.5,0]';
    for i=1:100,
       x=sol(1,i);
       y=sol(2,i);
       dx=202*x+2;
       dy=-200*y;
       sol(:,i+1)=sol(:,i)-0.1*[dx;dy];
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
       pause
    end;
end;
%No he conseguido realizar el ejercicio 1 y sus respectivos apartados, ya
%que me da un error que no logro solucionar.

%Experimentando con el metodo de Newton puedo responder alguno de los
%apartados del ejercicio 1:
%a y b: al incluir mas puntos en nuestros ejes, logramos una mayor
%precision al mostrar la imagen pero la i en el caso Newton sigue siendo en
%torno a 40, luego no produce un aumento o decremento en las iteraciones
%necesarias, pero si aumenta los recursos usados por el programa.
%c:Se porduce un apixelamiento de la imagen y es muestra un resultado
%ilegible y confuso.
%d:Se determinaran dependiendo de la funcion y de la recta grafica que esta
%ocasiona, luego requiere de observacion y atencion.

%Ejercicio 2:
clear all,close all,clc
[x,y]=meshgrid(-3:0.01:3,-4:0.01:4);
z=100*(x.^2-y.^2)+(1+x).^2;
sol=[10,10]';
while(1),
    close all
    pcolor(x,y,z),shading flat;hold on;
    for i=1:100,
       x=sol(1,i);
       y=sol(2,i);
       dx=202*x+2;
       dy=-200*y;
       dxx=202;       dxy=0;
       dyx=0;         dyy=-200;       
       H=[dxx dxy;dyx dyy];                     
       sol(:,i+1)=sol(:,i)-0.1*inv(H)*([dx;dy]);       
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r')
       pause
    end;
end;
