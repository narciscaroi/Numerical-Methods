function [A_k S] = task3(image, k)
   S = 0;
  %TODO
   A = double(imread(image));
  
   [m n] = size(A);
   miu = zeros(m,1);
  %1 
   for i = 1 : m
     sumai = 0;
      for j = 1 : n
        sumai = sumai + A(i,j);
      endfor
      miu(i) = sumai / n;
   endfor
   
   %2
   for i = 1 : m
    A(i,:) = A(i,:) - miu(i);
   endfor
   
   %3
   Z = zeros(n,m);
   Z = A' / sqrt(n-1);
   
   %4
   [U S V] = svd(Z);
   
   %5
   W = V(1:m, 1:k);
   
   %6
   Y = W' * A;
   
   %7
   A_k = W * Y + miu;
endfunction