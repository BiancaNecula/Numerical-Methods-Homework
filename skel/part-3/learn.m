function [w] = learn(X, y)
  
  X_tilda = [X ones(size(X, 1), 1)];
  [Q, R] = Householder(X_tilda, y);
  z = -Q \ y;
  [w] = SST(R, z);

end
