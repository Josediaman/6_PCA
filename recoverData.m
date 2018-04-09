function X_rec = recoverData(Z, U, K)
% X_rec: Aproximation of values of X.
% Z: New variables of the model.
% U: Vectors of the pca.
% K: number of dimensions.

% You need to return the following variables correctly.
X_rec = zeros(size(Z, 1), size(U, 1));


X_rec=(U(:,1:K)*Z')';


end
