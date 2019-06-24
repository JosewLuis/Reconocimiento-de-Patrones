%Cosita 1:
clear all;
close all;
A=imread('spine.jpg');
B=rgb2gray(A);  %Pasa imagen A a escala de grises.
subplot(2,2,1);subimage(A); %subimage=Impresion de imagen.
subplot(2,2,3);imhist(A);   %imhist=Distribucion de las intensidades de la imagen.
subplot(2,2,2);subimage(B);
subplot(2,2,4);imhist(B);

%Cosita 2:
clear all;
close all;
A=imread('spine.jpg');
R=imnoise(A,'salt & pepper',0.05);  %Aplica ruido, es decir, interferencias.
subplot(3,3,2);subimage(A);
subplot(3,3,5);subimage(R);
h1=fspecial('average');     %Crea un filtro.
h2=fspecial('average',[9,9]);
M1=imfilter(R,h1);
M2=imfilter(R,h2);
subplot(3,3,7);subimage(M1);
subplot(3,3,9);subimage(M2);
%A mayor tamaño del filtro, mayor reduccion del rudio.

%Cosita 3:
A=imread('peppers.jpg');
R=imnoise(A,'gaussian');
h1=fspecial('gaussian');
h2=fspecial('average');
G=imfilter(R,h1);
M=imfilter(R,h2);
subplot(2,2,1),subimage(A),title('Imagen original')
subplot(2,2,2),subimage(R),title('Imagen con ruido');
subplot(2,2,3),subimage(G),title('Filtro Gaussiano');
subplot(2,2,4), subimage(M),title('Filtro Media 3x3');