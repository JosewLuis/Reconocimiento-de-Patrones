%Ejercicio 1:
clear all;
close all;
x=[-2:0.05:2,2:0.01:4];
y1=x.^2-x+3;
y2=2*x+1;
f=y1.*((x>=-2)&(x<2))+y2.*((x<4)&(x>=2));
plot(x,f,'m');hold off;
axis([-10 10 -10 10]);

%Ejercicio 2:
clear all;
close all;
x=[-5:0,02:5];
y1=x.^2-3*x-2;
y2=x.^3-2*x+1;
%Ahora imprimimos todo:
subplot(2,1,1);plot(x,y1,'g-');hold on;
subplot(2,1,1);plot(2,1,'rx');hold on;
subplot(2,1,2);plot(x,y2,'b-');hold on;
subplot(2,1,2);plot(2,1,'rx');hold off;

%Ejercicio 3:
clear all;
close all;
A=imread('spine.jpg');
B=imnoise(A,'salt & pepper',0.05);  %Generamos la imagen con ruido.
f1=fspecial('average');
f2=fspecial('average',[9,9]);
f3=fspecial('gaussian');
B1=imfilter(B,f1);
B2=imfilter(B,f2);
B3=imfilter(B,f3);
subplot(3,3,2);subimage(A);title("Imagen original.");
subplot(3,3,5);subimage(B);title("Imagen con ruido.");
subplot(3,3,7);subimage(B1);title("Imagen con f1.");
subplot(3,3,9);subimage(B2);title("Imagen con f2.");
subplot(3,3,8);subimage(B3);title("Imagen con f3.");
%El f2 elimina mejor el ruido, esto se debe a que el tamaño del filtro es
%mayor. Al no haber aplicado un ruido gaussiano, el filtro gaussiano es
%odviamente ineficaz.

%Ejercicio 4:
clear all;
close all;
A=imread('peppers.jpg');
B=imnoise(A,'gaussian');
f1=fspecial('average');
f2=fspecial('average',[9,9]);
f3=fspecial('gaussian');
B1=imfilter(B,f1);
B2=imfilter(B,f2);
B3=imfilter(B,f3);
subplot(3,3,2);subimage(A);title("Imagen original.");
subplot(3,3,5);subimage(B);title("Imagen con ruido.");
subplot(3,3,7);subimage(B1);title("Imagen con f1.");
subplot(3,3,9);subimage(B2);title("Imagen con f2.");
subplot(3,3,8);subimage(B3);title("Imagen con f3.");
%Aparentemente, el filtro 9x9 y el gaussiano son los mejores para remover
%el ruido de esta imagen.
