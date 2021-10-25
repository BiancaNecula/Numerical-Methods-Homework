function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  
  [X, y1] = preprocess(path_to_testset, histogram, count_bins);
  for j = 1:size(X, 2)
    X(:, j) = (X(:, j) - mean(X(:, j))) ./ std(X(:, j));
  endfor
  X_tilda = [X ones(size(X, 1), 1)];
  y2 = X_tilda * w;
  y2(y2 >= 0) = 1;
  y2(y2 < 0) = -1;
  y = y1==y2;
  cnt = sum( y(y == 1) );
  percentage = cnt / length(y);
  
endfunction