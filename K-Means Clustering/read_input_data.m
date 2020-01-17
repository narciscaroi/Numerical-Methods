% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params, file_points)
	file1 = fopen(file_params, 'r');
  if file1 < 0
    fprintf("Couldn't open first file");
    return;
  endif
  
  file2 = fopen(file_points, 'r');
  if file2 < 0
    fprint("Couldn't opent second file");
    return;
  endif
	% set these values correctly
	NC = 0;
	points = [];

	% TODO read NC
	% TODO read points
  
  NC = fscanf(file1, '%d');
  points = dlmread(file2, ' ', 5,0);
  
  fclose(file1);
  fclose(file2);
end

