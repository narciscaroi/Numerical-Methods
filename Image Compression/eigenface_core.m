function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  database_path = strcat(database_path,'/');
  nume1= strcat(database_path,'1.jpg');
  nume2= strcat(database_path,'2.jpg');
  nume3= strcat(database_path,'3.jpg');
  nume4= strcat(database_path,'4.jpg');
  nume5= strcat(database_path,'5.jpg');
  nume6= strcat(database_path,'6.jpg');
  nume7= strcat(database_path,'7.jpg');
  nume8= strcat(database_path,'8.jpg');
  nume9= strcat(database_path,'9.jpg');
  nume10= strcat(database_path,'10.jpg');
  
  T = zeros(40000,1);
  A1 = double(rgb2gray(imread(nume1)));
  A2 = double(rgb2gray(imread(nume2)));
  A3 = double(rgb2gray(imread(nume3)));
  A4 = double(rgb2gray(imread(nume4)));
  A5 = double(rgb2gray(imread(nume5)));
  A6 = double(rgb2gray(imread(nume6)));
  A7 = double(rgb2gray(imread(nume7)));
  A8 = double(rgb2gray(imread(nume8)));
  A9 = double(rgb2gray(imread(nume9)));
  A10 = double(rgb2gray(imread(nume10)));
  
  A1 = A1';
  A1 = A1(:);
  T = [T A1];
  A2 = A2';
  A2 = A2(:);
  T = [T A2];
  A3 = A3';
  A3 = A3(:);
  T = [T A3];
  A4 = A4';
  A4 = A4(:);
  T = [T A4];
  A5 = A5';
  A5 = A5(:);
  T = [T A5];
  A6 = A6';
  A6 = A6(:);
  T = [T A6];
  A7 = A7';
  A7 = A7(:);
  T = [T A7];
  A8 = A8';
  A8 = A8(:);
  T = [T A8];
  A9 = A9';
  A9 = A9(:);
  T = [T A9];
  A10 = A10';
  A10 = A10(:);
  T = [T A10];
  T(:,1) = [];
  
  %2
  [l c] = size(T);
  m = zeros(l,1);
  for i = 1 : l
    sumnr = 0;
    for j = 1 : c
      sumnr += T(i,j);
    endfor
    m(i,1) = sumnr / c;
  endfor
  
  %3
  A = T - m;
  
  %4
  Z = A' * A;
  [lz cz] = size(Z);
  [a b] = eig(Z);
  V = zeros(lz,1);
  for i =1 :lz
    if b(i,i) > 0
      V = [V a(:,i)];
    endif
  endfor
  V(:,1) = [];
  eigenfaces = A * V;
  
  %5
  pr_img =  eigenfaces' * A;
  
end