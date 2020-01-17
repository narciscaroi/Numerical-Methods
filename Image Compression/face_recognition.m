function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
   Matr = double(rgb2gray(imread(image_path)));
   Matr = Matr';
   Matr = Matr(:);
   
   Matr = Matr - m;
   
   PrTestImg =  eigenfaces' * Matr;
   
   [l c] = size(pr_img);
   min_dist = 10^10;

   for i = 1 : c
      if norm(PrTestImg - pr_img(:,i)) < min_dist
        min_dist = norm(PrTestImg - pr_img(:,i));
        output_img_index = i;
      endif
   endfor
end