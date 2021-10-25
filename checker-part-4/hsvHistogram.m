function [sol] = hsvHistogram(path_to_image, count_bins)
  
  im = imread(path_to_image);
  im = double(im);
  [H, S, V] = RGB2HSV(im);
  h = floor(H * count_bins / 1.01);
  s = floor(S * count_bins / 1.01);
  v = floor(V * count_bins / 1.01);
  hist = h;
  hist = hist(:);
  out1 = accumarray(hist + 1, 1, [count_bins 1]);
  hist2 = s(:);
  out2 = accumarray(hist2 + 1, 1, [count_bins 1]);
  hist3 = v(:);
  out3 = accumarray(hist3 + 1, 1, [count_bins 1]);
  sol = cat(1, out1, out2, out3);
  sol = sol.';
  
end