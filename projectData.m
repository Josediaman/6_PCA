function Z = projectData(X, U, K)
% Z: new variables.
% X: Training examples.
% U: Vectors of the model.
% K: Number of final dimensions.


% Inital values.
Z = zeros(size(X, 1), K);
U_reduce=U(:,1:K);


Z=(U_reduce'*X')';


end
