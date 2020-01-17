% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
	centroids = [];
  n = rows(points);
  counteridx = rows(points);
 
   Vx = zeros(NC, 1);
   Vy = zeros(NC,1);
   Vz = zeros(NC,1);
   k =1;
  
  idx = randperm(n);
  centroids = points(idx(1:NC),:);
  
	% TODO K-Means code 
  while k > 0
   Gx = zeros(NC, 1);
   Gy = zeros(NC,1);
   Gz = zeros(NC,1);
   counter_dividend = zeros(NC,1);
   counter_type_points = zeros(n,1);
    j = 1;
    dist = zeros(NC,1);
    for i=1:n
      %[a, b] = min(vecnorm(points(i,:)-centroids,2,2));                                  
      %counter_type_points(i) = b;
      for j = 1:NC
        dist(j) = norm(points(i,:)-centroids(j,:));
        %[a, b] = min(dist(j));
      endfor
      [a, b] = min(dist(:));
      counter_type_points(i) = b;
    endfor
    
    for i = 1 : n
      for j = 1 : NC
        if counter_type_points(i) == j
          counter_dividend(j, 1) = counter_dividend(j, 1) + 1;
          Gx(j) = Gx(j) + points(i,1);
          Gy(j) = Gy(j) + points(i,2);
          Gz(j) = Gz(j) + points(i,3);
        endif
      endfor
    endfor
    
    
    
    for i=1:NC
      Gx(i) = Gx(i) / counter_dividend(i);
      Gy(i) = Gy(i) / counter_dividend(i);
      Gz(i) = Gz(i) / counter_dividend(i);
    endfor

    for i=1:NC
      centroids(i,1) = Gx(i); 
      centroids(i,2) = Gy(i);
      centroids(i,3) = Gz(i);
    endfor
    if Vx ==  Gx 
      if Vy == Gy
        if Vz == Gz
          return;
        endif
      endif
    endif
    Vx = Gx;
    Vy = Gy;
    Vz = Gz;
  endwhile
end
  