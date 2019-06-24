close all, clear all, clc;
matrix=[1,1,1;1,0,1;1,1,1]
imtool(matrix); %Open the image viewer app in an empty state.
matrix2=matrix<1
imtool(matrix2);
%0s=negro, 1s=blanco.