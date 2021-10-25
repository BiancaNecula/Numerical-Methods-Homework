function [G_J, c_J] = Jacobi_factorization(A, b)
  
  U = triu(A, 1);
  L = tril(A, -1);
  D = A - U - L;
  U = -U;
  L = -L;
  G_J = D \ (L + U);
  c_J = D \ b;

endfunction
