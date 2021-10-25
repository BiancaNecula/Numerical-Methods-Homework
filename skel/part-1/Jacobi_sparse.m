function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  
  N = 1000; i = 1;  
  n = length(G_rowptr) - 1;
  x = zeros(n, 1);
  while(i < N)
    x0 = x;
    x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
    B = max(abs(x - x0));
    i++;
    if(B < tol) 
      break; 
    endif
  endwhile
  
endfunction