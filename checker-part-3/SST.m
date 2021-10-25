function [x] = SST(A, b)
  [m, n] = size(A);
  x = zeros(n, 1);
  for j = n:-1:2
    x(j) = b(j) / A(j, j);
    b(1:j-1) = b(1:j-1) - x(j) * A(1:j-1, j);
  end
  x(1) = b(1) / A(1,1);
end
    