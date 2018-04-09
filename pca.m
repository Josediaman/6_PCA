function [U, S] = pca(X)
% U: normal vectors.
% S: parameters of the model.
% X: Training examples.


% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

Sigma=(1/m)*X'*X;
[U,S,V] = svd(Sigma);


end
