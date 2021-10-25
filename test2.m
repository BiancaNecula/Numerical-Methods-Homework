im = double(imread("/home/bianca/Documents/MN_tema1/checker-part-3/ref/input/458003.jpg"));
[rows, columns, temp] = size(im);
H=zeros(rows, columns);
R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
R2 = ( R / 255.0 );
G2 = ( G / 255.0 );
B2 = ( B / 255.0 );
M = max(max(R2, G2), B2);
m = min(min(R2,G2), B2);
V = M;
C = M-m;
if (V == 0)
  S = 0;
else
  S = C./V;
end
%T=R2==M; 
%H = T .* (60* mod((G2-B2)./C, 6));
%P=M==G2;
%H = H+ P.*(60*((B2-R2)./C + 2));
%L=M==B2;
%H = H+ L.*(60*((R2-G2)./C +4));
%T=C~=0; H=H.*T;
%H = H/360
for i=1:rows
for j=1:columns
if (C(i,j)==0)
  H(i,j)=0;
elseif (M(i,j)==R2(i,j))
  H(i,j) = 60 * mod((G2(i,j)-B2(i,j))/C(i,j),6);
elseif (M(i,j)==G2(i,j))
  H(i,j) = 60 * ((B2(i,j)-R2(i,j))/C(i,j) + 2);
elseif (M(i,j)==B2(i,j))
  H(i,j) = 60 * ((R2(i,j)-G2(i,j))/C(i,j) +4);
end
H(i,j)=H(i,j)/360;
end
end
%if(C ==0)
%  H =0;
%elseif(M==R2)
%  H = 60* mod((G2-B2)./C, 6);
%elseif(M==G2)
%  H = 60*((B2-R2)./C + 2);
%elseif(M==B2)
%  H = 60*((R2-G2)./C +4);
%end
%H=H/360;
H(isnan(H))=0;
S(isnan(S))=0;
V(isnan(V))=0;

hsv = rgb2hsv(im);
H2 = hsv(:,:,1);
H==H2