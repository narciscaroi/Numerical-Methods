function task2()
   %TODO
  A = double(imread('in\images\image1.gif'));
  [U S V] = svd(A);
  [m n] = size(A);
  minim = min([m,n]);
  k = 25;
  matr_min = 1:minim;
  
  %1
  val_prop = svd(A);
  figure(1);
  plot(matr_min,val_prop);
 
 %2
  sum1 = 0;
  sum2 = 0;
  suma = zeros(1,k);
  for i = 1 : minim
    sum2 = sum2 + S(i,i);
  endfor
  
  for i = 1 : minim
   sum1 = sum1 + S(i,i);
   suma(1,i) = sum1 / sum2;
  endfor
  
  figure(2);
  plot(matr_min, suma);
  
  %3
  c = columns(matr_min);
  sumtot = zeros(1,c);
  for l = 1:c
    Ak=task1('in\images\image1.gif',l);
    [o p] = size(Ak);
   sumaux = 0;
   for i = 1 : o
      for j = 1 : p
        sumaux += (A(i,j) - Ak(i,j))^2;
      endfor
   endfor
   sumtot(1,l) = sumaux / m * n;  
  endfor
  
  figure(3);
  plot(matr_min, sumtot);
  
  %4
  sum4 = zeros(1,k);
  for i = 1 : minim
    sum4(1,i) = ((m*i)+(n*i)) / (m * n);
  endfor
  figure(4);
  plot(matr_min, sum4);
endfunction