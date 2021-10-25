function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  
  path1 = fullfile(path_to_dataset, "cats/");
  path2 = fullfile(path_to_dataset, "not_cats/");
  files1 = dir(fullfile( path1, '*.jpg' ));
  files2 = dir(fullfile( path2, '*.jpg' ));
  X = zeros( length(files1) + length(files2), count_bins*3 );
  y = zeros( length(files1) + length(files2), 1 ); 
  
  for k = 1:length(files1)
     filename = fullfile(path1, files1(k).name);
     if histogram == 'RGB'
       [sol] = rgbHistogram(filename, count_bins);
     elseif histogram == 'HSV'
       [sol] = hsvHistogram(filename, count_bins);
     endif
     X(k, :) = sol;
     y(k) = 1;
  endfor 
  for k=1:length(files2)
    filename = fullfile(path2, files2(k).name);
    if histogram == 'RGB'
      [sol] = rgbHistogram(filename, count_bins);
    elseif histogram == 'HSV'
      [sol] = hsvHistogram(filename, count_bins);
    endif
    X(k + length(files1), :) = sol;
    y(k + length(files1)) = -1;
   endfor 
   
endfunction
