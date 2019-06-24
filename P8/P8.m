clear all,close all,clc
%Ejercicio 1:
%a:
randn('seed',0);
A=round(20+randn(1,500)*5); %Golden.
B=round(30+randn(1,500)*2); %Bass
%b:
figure,hist(A,0:1:40);
figure,hist(B,0:1:40);
%c:
for i=1:1:2,
    for j=0:1:36,
        if(i==1),
            c1=j<=A;   c2=A<(j+1);
            p{i,j+1}=(length(A(c1&c2))*100)/500;
        else
            c1=j<=B;   c2=B<(j+1);
            p{i,j+1}=(length(B(c1&c2))*100)/500;
        end,
    end,
end,
%d:
%If a fish length is less than or equal to 24, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:23,
    prob1=prob1+p{1,j+1};   %74.
end,
prob2=0;
for j=24:1:36,
    prob2=prob2+p{2,j+1};   %100.
end,
%Luego es un suceso posible.
%If a fish length is less than or equal to 25, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:25,
    prob1=prob1+p{1,j+1};   %84,4.
end,
prob2=0;
for j=26:1:36,
    prob2=prob2+p{2,j+1};   %98,6
end,
%Luego es un suceso bastante posible.
%If a fish length is less than or equal to 26, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:26,
    prob1=prob1+p{1,j+1};   %89,8.
end,
prob2=0;
for j=27:1:36,
    prob2=prob2+p{2,j+1};   %95,8.
end,
%Luego es un suceso bastante posible.
%If a fish length is less than or equal to 27, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:27,
    prob1=prob1+p{1,j+1};   %92.
end,
prob2=0;
for j=28:1:36,
    prob2=prob2+p{2,j+1};   %86.
end,
%Luego es un suceso bastante probable.
%If a fish length is less than or equal to 28, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:28,
    prob1=prob1+p{1,j+1};   %95,2.
end,
prob2=0;
for j=29:1:36,
    prob2=prob2+p{2,j+1};   %71.
end,
%Luego es un suceso posible.
%e:
%1:
A=round(20+randn(1,50)*5); %Golden.
B=round(30+randn(1,500)*2); %Bass
for i=1:1:2,
    for j=0:1:36,
        if(i==1),
            c1=j<=A;   c2=A<(j+1);
            p{i,j+1}=(length(A(c1&c2))*100)/50;
        else
            c1=j<=B;   c2=B<(j+1);
            p{i,j+1}=(length(B(c1&c2))*100)/500;
        end,
    end,
end,
%If a fish length is less than or equal to 24, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:23,
    prob1=prob1+p{1,j+1};   %78.
end,
prob2=0;
for j=24:1:36,
    prob2=prob2+p{2,j+1};   %99,6.
end,
%Luego es un suceso posible.
%If a fish length is less than or equal to 25, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:25,
    prob1=prob1+p{1,j+1};   %82.
end,
prob2=0;
for j=26:1:36,
    prob2=prob2+p{2,j+1};   %98,6.
end,
%Luego es un suceso bastante posible.
%If a fish length is less than or equal to 26, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:26,
    prob1=prob1+p{1,j+1};   %84.
end,
prob2=0;
for j=27:1:36,
    prob2=prob2+p{2,j+1};   %95.
end,
%Luego es un suceso bastante posible.
%If a fish length is less than or equal to 27, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:27,
    prob1=prob1+p{1,j+1};   %90.
end,
prob2=0;
for j=28:1:36,
    prob2=prob2+p{2,j+1};   %87,6.
end,
%Luego es un suceso bastante probable.
%If a fish length is less than or equal to 28, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:28,
    prob1=prob1+p{1,j+1};   %94.
end,
prob2=0;
for j=29:1:36,
    prob2=prob2+p{2,j+1};   %76,4.
end,
%Luego es un suceso posible.
%2:
A=round(20+randn(1,500)*5); %Golden.
B=round(30+randn(1,50)*2); %Bass
for i=1:1:2,
    for j=0:1:36,
        if(i==1),
            c1=j<=A;   c2=A<(j+1);
            p{i,j+1}=(length(A(c1&c2))*100)/500;
        else
            c1=j<=B;   c2=B<(j+1);
            p{i,j+1}=(length(B(c1&c2))*100)/50;
        end,
    end,
end,
%If a fish length is less than or equal to 24, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:23,
    prob1=prob1+p{1,j+1};   %79,4.
end,
prob2=0;
for j=24:1:36,
    prob2=prob2+p{2,j+1};   %100.
end,
%Luego es un suceso bastante posible.
%If a fish length is less than or equal to 25, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:25,
    prob1=prob1+p{1,j+1};   %88.
end,
prob2=0;
for j=26:1:36,
    prob2=prob2+p{2,j+1};   %100.
end,
%Luego es un suceso bastante posible.
%If a fish length is less than or equal to 26, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:26,
    prob1=prob1+p{1,j+1};   %92.
end,
prob2=0;
for j=27:1:36,
    prob2=prob2+p{2,j+1};   %98.
end,
%Luego es un suceso bastante posible.
%If a fish length is less than or equal to 27, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:27,
    prob1=prob1+p{1,j+1};   %94,4.
end,
prob2=0;
for j=28:1:36,
    prob2=prob2+p{2,j+1};   %90.
end,
%Luego es un suceso bastante probable.
%If a fish length is less than or equal to 28, it is golden fish, else, it
%is bass:
prob1=0;
for j=0:1:28,
    prob1=prob1+p{1,j+1};   %96,6.
end,
prob2=0;
for j=29:1:36,
    prob2=prob2+p{2,j+1};   %82.
end,
%Luego es un suceso posible.
%A la conclusion que llego es que se producen variaciones apreciables en
%los porcentajes cambiando el tamaño los datos de entrada, por lo que
%mientras mas datos tengamos mejor, pero esto no siempre es posible y es
%por eso que escojamos muestras, la cual es importante que sea lo mas
%representativa posible del conjunto total de datos.
%f:
%If a fish length is less than or equal to N, it is golden fish, else, it is bass.
%Con 500/500.
A=round(20+randn(1,500)*5); %Golden.
B=round(30+randn(1,500)*2); %Bass
for i=1:1:2,
    for j=0:1:36,
        if(i==1),
            c1=j<=A;   c2=A<(j+1);
            p{i,j+1}=(length(A(c1&c2))*100)/500;
        else
            c1=j<=B;   c2=B<(j+1);
            p{i,j+1}=(length(B(c1&c2))*100)/500;
        end,
    end,
end,
probM1=0;
probM2=0;
probN=0;
for N=1:1:36,
    prob1=0;
    for j=0:1:N,
        prob1=prob1+p{1,j+1};   
    end,
    prob2=0;
    for j=N:1:36,
        prob2=prob2+p{2,j+1};   
    end,
    if(prob1>=probM1 && prob2>=probM2),
        probM1=prob1;
        probM2=prob2;
        probN=N;
    end,
end,
%Sobre N=24.
%Con 500/50.
A=round(20+randn(1,500)*5); %Golden.
B=round(30+randn(1,50)*2); %Bass
for i=1:1:2,
    for j=0:1:36,
        if(i==1),
            c1=j<=A;   c2=A<(j+1);
            p{i,j+1}=(length(A(c1&c2))*100)/500;
        else
            c1=j<=B;   c2=B<(j+1);
            p{i,j+1}=(length(B(c1&c2))*100)/50;
        end,
    end,
end,
probM1=0;
probM2=0;
probN=0;
for N=1:1:36,
    prob1=0;
    for j=0:1:N,
        prob1=prob1+p{1,j+1};   
    end,
    prob2=0;
    for j=N:1:36,
        prob2=prob2+p{2,j+1};   
    end,
    if(prob1>=probM1 && prob2>=probM2),
        probM1=prob1;
        probM2=prob2;
        probN=N;
    end,
end,
%Sobre N=27.
%Con 50/500.
A=round(20+randn(1,50)*5); %Golden.
B=round(30+randn(1,500)*2); %Bass
for i=1:1:2,
    for j=0:1:36,
        if(i==1),
            c1=j<=A;   c2=A<(j+1);
            p{i,j+1}=(length(A(c1&c2))*100)/50;
        else
            c1=j<=B;   c2=B<(j+1);
            p{i,j+1}=(length(B(c1&c2))*100)/500;
        end,
    end,
end,
probM1=0;
probM2=0;
probN=0;
for N=1:1:36,
    prob1=0;
    for j=0:1:N,
        prob1=prob1+p{1,j+1};   
    end,
    prob2=0;
    for j=N:1:36,
        prob2=prob2+p{2,j+1};   
    end,
    if(prob1>=probM1 && prob2>=probM2),
        probM1=prob1;
        probM2=prob2;
        probN=N;
    end,
end,
%sobre N=25.