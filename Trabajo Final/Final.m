clear all, close all, clc
A=imread('001.jpg');     %Lectura de imagen.
figure,imshow(A);
B=rgb2gray(A);              %Conversion de la imagen a escala de grises.
figure,imshow(B);
A1=im2bw(B,0.9); %Pasamos la imagen a binario.
figure,imshow(A1);

A2=bwlabel(A1);   %Etiquetamos los numeros, del 1 al 9.
for i=1:9,
    n{i}=roicolor(A2,i,i);
end

for i=1:9,
    subplot(3,3,i);imshow(n{i});hold on;
end

for i=1:9,
    n{i}=centrar(n{i},1);
end