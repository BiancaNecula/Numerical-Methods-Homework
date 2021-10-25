function [centroids] = clustering_pc(points, NC)
  
 [nr_puncte, dim] = size(points); 
 centroids = zeros(NC, dim); %centroizi initiali
 clusters = zeros(nr_puncte, NC);
 for i = 1:NC
   tot = zeros(1, dim);
   
   for j = 1:nr_puncte
     if mod(j, NC) == i
        clusters(j, i) = 1;
        tot += points(j, :);
     elseif mod(j, NC) == 0 && i == NC
        clusters(j, i) = 1;
        tot += points(j, :);
     endif
   endfor
   
   d = nr_puncte / NC;
   centroids(i, :) = tot ./ d;
 endfor
 
 while 1
   new_clusters = zeros(nr_puncte, NC);
   
   for i = 1:nr_puncte %pt fiecare punct
     distanta = zeros(1, NC); % calculam distanta catre fiecare centroid
     
     for j = 1:NC
       total = 0; diff = 0;
       for z = 1:dim
         diff = points(i, z) - centroids(j,z);
         total += (diff * diff);     
       endfor
       distanta(j) = sqrt(total);
     endfor
     
     [minim, index] = min(distanta);
     new_clusters(i, :) = zeros(1, length(new_clusters(i, :)));
     new_clusters(i, index) = 1; 
   endfor
   
   for i = 1:NC
     tot = zeros(1, dim); %vector pt adunarea tuturor punctelor de pe un cluster
     count = 0;
     
     for j =1:nr_puncte
       if new_clusters(j, i) == 1
         tot += points(j, :);
         count++;
       endif
     endfor
     
     if count == 0
      centroids(i, :) = zeros(1, dim);
     else
       centroids(i, :) = tot ./ count;
     endif
   endfor
   
   if new_clusters == clusters
     break;
   else
     clusters = new_clusters;
   endif
 endwhile
 
endfunction
