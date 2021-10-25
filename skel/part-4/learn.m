function [w] = learn(X, y, lr, epochs)
  
  for j = 1:size(X, 2)
    X(:, j) = (X(:, j) - mean( X(:, j) )) ./ std( X(:, j) );
  endfor
  X_tilda = [X ones(size(X, 1), 1)];
  [N, n] = size(X_tilda);
  w = zeros(n, 1);
  w = w + rand(n, 1) * 0.2 - 0.1;
  for i = 1:epochs
    k = randperm( size(X_tilda, 1) );
    X_batch = X_tilda( k(1:64), : );
    y_batch = y( k(1:64), : );
    for z = 1:n
      sum = 0;
      for t = 1:64
        sum = sum + ( X_batch(j, :) * w - y_batch(j) ) * X_batch(t, z); 
      endfor
      w(z) = w(z)-(lr / N) * sum;
    endfor
  endfor
  
endfunction
