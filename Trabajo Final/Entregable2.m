clear all, close all, clc
A=imread('prueba.jpg');     %Lectura de imagen.
figure,imshow(A);
B=rgb2gray(A);              %Conversion de la imagen a escala de grises.
figure,imshow(B);
%La funcion que emplearemos para subdividir nestra imagen para realizar un analisis separado sera imcrop,
%nuestro proposito siguiente es encontrar las dimensiones para dividir.
%A1=imcrop(A,[20,30,100,100]);

%Existen 3 tipos de segmentacion:
%-Segmentacion basada en pixeles:
%Este m�todo tiene en cuenta el nivel de gris de un p�xel para decidir si el mismo
%pertenece o no al objeto de inter�s, para ello debemos encontrar el rango de niveles de
%gris que caracterizan dicho objeto, teniendo en cuenta la propiedad de similitud. Para
%ello obtendremos previamente el histograma de la imagen.
%Esta t�cnica tambi�n se conoce como segmentaci�n basada en umbralizaci�n, porque
%convertimos una imagen con varios niveles de gris en una nueva con s�lo dos niveles,
%de manera que los objetos quedan separados del fondo, bas�ndonos en que los p�xeles
%de un determinado objeto tienen el mismo valor de gris.

%-Segmentacion basada en bordes:
%Esta t�cnica realiza la b�squeda del valor m�ximo del gradiente sobre cada l�nea que
%forma la imagen. Cuando se encuentra un m�ximo, usamos un algoritmo de trazado para
%seguir el m�ximo del gradiente alrededor del objeto hasta encontrar de nuevo el punto
%inicial. Y volvemos a buscar un nuevo m�ximo, etc.
%Se parte de los bordes encontrados en la imagen por los detectores, puesto que por s�
%mismos no pueden unir los bordes, debido a que est�n afectados por el ruido de la
%imagen y adem�s hay partes que no son detectadas.

%-Segmentacion basada en texturas:
%Esta t�cnica se caracteriza por las propiedades explicadas en el apartado 3.2, para
%realizar la partici�n de las im�genes. Pudiendo optar por una aproximaci�n estad�stica
%con sus correspondientes propiedades diferenciadoras entre unas partes y otras o por una
%aproximaci�n por frecuencias, definiendo el contenido local en frecuencias de una
%determinada regi�n.

%Para esta pagina usaremos segmentacion basada en pixeles:

%Mostramos la imagen leida:
A1=im2bw(B,0.9); %Pasamos la imagen a binario.
figure,imshow(A1);
A2=bwlabel(A1);   %Etiquetamos los numeros, del 1 al 9.
%Mediante roicolor extraemos cada gama encontrada en bwlabel.
for i=1:9,
    n{i}=roicolor(A2,i,i);
end

for i=1:9,
    subplot(3,3,i);imshow(n{i});hold on;
end

%Como podemos observar al ejecutar los plots, la imagen no esta ajustada,
%queda pendiente ajustar cada una de las imagenes objetidas y analizarlas
%cada una para ver que numero es.

for i=1:9,
    n{i}=centrar(n{i},1);
end
