function [A, b] = generate_probabilities_system(rows)
sum=0;counter=1;
for i = 1:rows
  sum += i;
endfor
A = zeros(sum, sum);
b= zeros(sum, 1);
if(rows == 1)
  A(1,1) = 3;
else
  A(1,1) = 4;  
  A(1,2) = -1; A(1,3)=-1;
  for i = 2:(rows-1)
    for j = 1:i
        counter=counter+1;
        if(j == 1)
          A(counter,counter) = 5;
          A(counter,counter+1) = -1;
          A(counter, counter+i+1) = -1;
          A(counter, counter+i) = -1;
          if(i == 2) 
             A(counter, counter-1) = -1;
          else 
             A(counter, counter-i+1) = -1;
          endif
        elseif(j == i)
          A(counter,counter) = 5;
          A(counter,counter-1) = -1;
          A(counter, counter+i+1) = -1;
          A(counter, counter+i) = -1;
          A(counter, counter-i) = -1;
        else
          A(counter,counter) = 6;
          A(counter, counter+1) = -1;
          A(counter, counter-1) = -1;
          A(counter, counter+i+1) = -1;
          A(counter, counter+i) = -1;
          A(counter, counter-i+1) = -1;
          A(counter, counter-i) = -1;
        endif
    endfor
  endfor
  for j = 1:rows
    counter=counter+1;
    b(counter, 1) = 1;
    if(j==1)
      A(counter, counter) = 4;
      A(counter, counter+1) = -1;
       A(counter, counter-i) = -1;
    elseif(j==rows)
      A(counter, counter) = 4;
      A(counter, counter-1) = -1;
       A(counter, counter-i-1) = -1;
    else
      A(counter, counter) = 5;
      A(counter, counter-1) = -1;
      A(counter, counter+1) = -1;
      A(counter, counter-i) = -1;
      A(counter, counter-i-1) = -1;
    endif
  endfor
  
endif
endfunction