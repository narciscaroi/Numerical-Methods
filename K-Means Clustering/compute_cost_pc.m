% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; 
	% TODO compute clustering solution cost
  NC = rows(centroids);
  n = rows(points);
  array_cost = zeros(NC,1);
  min_dist = zeros(n,1);
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
	 min_dist(i) = a;
    endfor
  
  for i = 1 : n
      for j = 1 : NC
        if counter_type_points(i) == j
          array_cost(j) = array_cost(j) + min_dist(i);
        endif
      endfor
  endfor
    
    for i = 1:NC
      cost = cost + array_cost(i);
    endfor
   
end

