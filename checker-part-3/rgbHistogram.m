function [sol] = rgbHistogram(path_to_image, count_bins)
  
  I = imread(path_to_image);
  im = double(I);
  R = im(:, :, 1);
  G = im(:, :, 2);
  B = im(:, :, 3);
  red_chan = floor(R * count_bins / 256);
  green_chan = floor(G * count_bins / 256);
  blue_chan = floor(B * count_bins / 256);
  h = red_chan + 1;
  h = h(:);
  out1 = accumarray(h, 1, [count_bins 1]);
  h = green_chan + 1;
  h = h(:);
  out2 = accumarray(h, 1, [count_bins 1]);
  h = blue_chan + 1;
  h = h(:);
  out3 = accumarray(h, 1, [count_bins 1]);
  sol = cat(1, out1, out2, out3);
  sol = sol.';

end