function [cost] = compute_cost_pc(points, centroids)
  [NC, temp] = size(centroids);
  [nr_puncte, dim] = size(points); 
  cost =0;
   for i = 1:nr_puncte %pt fiecare punct
     distanta = zeros(1, NC); % calculam distanta catre fiecare centroid
     for j=1:NC
       total = 0; diff =0;
       for z=1:dim
         diff = points(i, z) - centroids(j,z);
         total += (diff * diff);     
       endfor
       distanta(j) = sqrt(total);
     endfor
     [minim, index] = min(distanta);
    cost += minim;
    endfor
endfunction

