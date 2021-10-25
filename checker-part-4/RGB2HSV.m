function [H, S, V] = RGB2HSV(im)
  
  [rows, columns, temp] = size(im);
  H = zeros(rows, columns);
  R = im(:, :, 1);
  G = im(:, :, 2);
  B = im(:, :, 3);
  R2 = ( R / 255.0 );
  G2 = ( G / 255.0 );
  B2 = ( B / 255.0 );
  M = max( max(R2, G2), B2 );
  m = min( min(R2, G2), B2 );
  V = M;
  C = M-m;
  
  if (V == 0)
    S = 0;
  else
    S = C./V;
  end
  
  T = R2==M; %T(C==0)=0;
  H(T) = 60 * mod(( G2(T) - B2(T) ) ./ C(T), 6);
  P = G2==M; %P(C==0)=0;
  H(P) = 60 * (( B2(P) - R2(P) ) ./ C(P) + 2);
  L = B2==M; %L(C==0)=0;
  H(L) = 60*(( R2(L) - G2(L) ) ./ C(L) + 4);
  Q = C==0; H(Q) = 0;
  H = H./360;

  H(isnan(H))=0;
  S(isnan(S))=0;
  V(isnan(V))=0;
  
end
