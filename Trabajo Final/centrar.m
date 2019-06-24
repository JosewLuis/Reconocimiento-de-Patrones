%F=centrar(ima,op)
%Esta funcion devuelve una imagen binaria centrada.
%ima=Imagen a centrar.      op=Pixeles que centrar 1 blanco,0 negro
function F=centrar(ima,op)
[f,c]=size(ima);
der=c;	izq=1;	sup=f;	inf=1;
for i=1:f,
	for j=1:c,
		if ima(i,j)==op
			%Recorre la imagen bucando el pixel de mas arriba,abajo,
			%izquierda y derecha del objeto a centrar.
			if der>j
				der=j;
			end
			if izq<j
				izq=j;
			end
			if sup>i
				sup=i;
			end
			if inf<i
				inf=i;
			end
		end
	end
end
%Ahora creamos una imagen con las dimensiones calculadas.
xx=inf-sup;	yy=der-izq;	F=zeros(yy,xx);
x1=1;	y1=1;
for i=sup:inf
	for j=der:izq
		F(y1,x1)=ima(i,j);
		x1=x1+1;
	end
	x1=1;
	y1=y1+1;
end
figure,imshow(F);
end