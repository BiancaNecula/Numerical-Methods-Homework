function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  
  [x, y1] = preprocess(path_to_testset, histogram, count_bins);
  X = [x ones(size(x, 1), 1)];
  y2 = X * w;
  y2(y2 >= 0) = 1;
  y2(y2 < 0) = -1;
  y = y1==y2;
  cnt = sum( y( y==1 ) );
  percentage = cnt / length(y);
  
endfunction