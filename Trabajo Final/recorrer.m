functionJ=recorrer(ime,opc)

[f c]=size(ime);
der=c;
izq=1;
sup=f;
inf=1;
	for y=1:f;
		forx=1:c;
			ifime(y,x)==opc	%se recorre la imagen en busca de 
							%cada pixel que este más arriba, 
							%el más abajo, el mas a la %izquierda y el mas a la %derecha.del objeto....% 
				if der>x
					der=x;
				end 
				if izq<x 
					izq=x;
				end 
				if sup>y
					sup=y;
				end
				if inf<y
					inf=y;
				end 
			end 
    end %se crea un na imagen o matriz con las dimensiones del objetoobtenidas anteriormente
	xx=inf-sup;
	yy=der-izq;
	J=zeros(yy,xx);
	x1=1;y1=1;
	for y=sup:inf
		for x=der:izq
			J(y1,x1)=ime(y,x);
			%se recore solo el objeto contenido en la imagen y sepasa a la imagen nueva.. %quedando contenido solo el objeto deseado..
			x1=x1+1;
		end 
		x1=1;
		y1=y1+1;
	end 
	figure,imshow(J);%se muestra la imagen resultado... 
end