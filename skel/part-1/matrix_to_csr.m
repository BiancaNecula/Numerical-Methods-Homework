function [values, colind, rowptr] = matrix_to_csr(A)
  
  len = size(A);
  index = 1;
  z = 1;
  for i = 1:len
    ok = 1;
    for j = 1:len
      if(A(i, j) != 0)
        if(ok == 1)
          rowptr(z) = index;
          ok = 0;
          z++;
        endif
        values(index) = A(i, j);
        colind(index) = j;
        index++;
      endif
    endfor
  endfor 
  rowptr(z) = length(values) + 1;

endfunction