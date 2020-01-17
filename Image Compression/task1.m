function A_k = task1(image, k)
  %TODO
  image_matrix = double(imread(image));
  %img = rgb2gray(image_matrix);
  %image_matrix = imshow(uint8(image_matrix));
  
  [U S V] = svd(image_matrix);
  [m n] = size(S);
  
  Uk = U(1:m, 1:k);
  Sk = S(1:k, 1:k);
  Vk = V(1:n, 1:k);
  
  A_k = Uk * Sk * Vk';
end