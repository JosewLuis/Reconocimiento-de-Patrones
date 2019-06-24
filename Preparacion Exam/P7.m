clear, close, clc
%Practica de pececillos.

%a.
randn('seed',0);
A=round(20+randn(1,500)*5); %Golden.
B=round(30+randn(1,500)*2); %Bass.

%b.
figure;
subplot(1,2,1),hist(A,5:40);
subplot(1,2,2),hist(B,20:35);

%c.
[a1,b1]=hist(A,5:40);
Aprob=(a1.*100)/500;

[a2,b2]=hist(B,20:35);
Bprob=(a2.*100)/500;


%d.
%If a fish length is less than or equal to 24, it is golden fish, else, it is bass.
b=(b1<=24);
pos=Aprob.*b;
PosGolden=sum(pos);

b=(b2>24);
pos=Bprob.*b;
PosBass=sum(pos);

Posibilidad(1)=(PosGolden+PosBass)/2;

%If a fish length is less than or equal to 25, it is golden fish, else, it is bass.
b=(b1<=25);
pos=Aprob.*b;
PosGolden=sum(pos);

b=(b2>25);
pos=Bprob.*b;
PosBass=sum(pos);

Posibilidad(2)=(PosGolden+PosBass)/2;

%If a fish length is less than or equal to 26, it is golden fish, else, it is bass.
b=(b1<=26);
pos=Aprob.*b;
PosGolden=sum(pos);

b=(b2>26);
pos=Bprob.*b;
PosBass=sum(pos);

Posibilidad(3)=(PosGolden+PosBass)/2;

%If a fish length is less than or equal to 27, it is golden fish, else, it is bass.
b=(b1<=27);
pos=Aprob.*b;
PosGolden=sum(pos);

b=(b2>27);
pos=Bprob.*b;
PosBass=sum(pos);

Posibilidad(4)=(PosGolden+PosBass)/2;

%If a fish length is less than or equal to 28, it is golden fish, else, it is bass.
b=(b1<=28);
pos=Aprob.*b;
PosGolden=sum(pos);

b=(b2>28);
pos=Bprob.*b;
PosBass=sum(pos);

Posibilidad(5)=(PosGolden+PosBass)/2;

%Mejor:
[Mejor,pos]=max(Posibilidad);
sol=sprintf('La mejor posibilidad es %0.3f y se encuentra en %d.',Mejor,24+pos);
disp(sol);