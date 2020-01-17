function view_cost_vs_nc(file_points)
	% TODO compute cost for NC = [1..10] and plot 
  file1 = fopen(file_points, 'r');
  if file1 < 0
    fprint("Couldn't opent second file");
    return;
  endif
  points = dlmread(file1, ' ', 5,1);
  fclose(file1);
  x = zeros(1,10);
  NC = zeros(1,10);
  
  for j = 1:10
    centroids = zeros(j, 3);
    NC(1,j) = j;
    centroids = clustering_pc(points,NC(1,j));
    x(1,j) = compute_cost_pc(points, centroids);
  endfor
  
  plot(NC,x);
  title('Cluster Cost');
  ylabel('Cost');
  xlabel('Cluster count');
end
