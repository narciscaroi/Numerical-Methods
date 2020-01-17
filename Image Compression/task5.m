function task5()
  %TODO
  A = double(imread('in\images\image4.gif'));
  [m n] = size(A);
  minimum = min([m,n]);
  k = [1:minimum];
  [Ak S] = task3('in\images\image4.gif', 1);
  
  %1
  diags = diag(S);
  figure(1);
  plot(k, diags);
  
  %2
  retsum = zeros(1,minimum);
   Z = A' / sqrt(n-1);
   [Uz Sz Vz] = svd(Z);
   x = diag(Sz);
   sumz = 0;
  for i = 1 : minimum
    sumz += S(i,i);
  endfor
  sumaz = 0;
  for i = 1 : minimum
    sumaz += x(i);
    retsum(i) = sumaz / sumz;
  endfor
  figure(2);
  plot(k,retsum);
  
  %3
  c = columns(k);
  sumtot = zeros(1,c);
  for l = 1:c
    Ak=task1('in\images\image4.gif',l);
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
  plot(k, sumtot);
  
  %4
  rc = zeros(1,c);
  for i = 1 : c
    rc(1,i) = (2 * i + 1) /  n;
  endfor
  
  figure(4);
  plot(k,rc);
end