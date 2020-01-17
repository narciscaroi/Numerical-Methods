% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	% TODO graphical representation coded here 
  NC = rows(centroids);
  n = rows(points);
  x = zeros(n,1);
  y = zeros(n,1);
  z = zeros(n,1);
  
  dist = zeros(NC,1);
   for i=1:n
     %[a, b] = min(vecnorm(points(i,:)-centroids,2,2));                                  
     %counter_type_points(i) = b;
     for j = 1:NC
       dist(j) = norm(points(i,:)-centroids(j,:));
       %[a, b] = min(dist(j));
     endfor
     [~, b] = min(dist(:));
     counter_type_points(i) = b;
    endfor
  
  x = points(:,1);
  y = points(:,2);
  z = points(:,3);
  
  for i = 1:n
    for j = 1:NC
      if counter_type_points(i) == j
        if j == 1
          scatter3( x(i), y(i), z(i), 'MarkerEdgeColor', 'k',
                    'MarkerFaceColor', 'red');
          hold on
        endif
        if j == 2
          scatter3( x(i), y(i), z(i), 'MarkerEdgeColor', 'k',
                    'MarkerFaceColor', 'blue');
          hold on
        endif
        if j == 3
          scatter3( x(i), y(i), z(i), 'MarkerEdgeColor', 'k',
                      'MarkerFaceColor', 'green');
          hold on
        endif
      endif
    endfor
  endfor
  hold off
  title('K-Means');
  view(50,25);
  xlabel('X');
  ylabel('Y');
  zlabel('Z');
  
end

