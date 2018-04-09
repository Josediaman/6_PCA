
function [K_vec, error] = ...
    validationCurve(S,n);
% K_vec: number of final dimension. 
% Error: error of pca.
% S: parameters of the model.
% n: number of parameters.


K_vec = [1];
if(n>2)
for i=2:(n-1),
K_vec = [K_vec i];
endfor
endif
K_vec=K_vec';
error = zeros(length(K_vec), 1);


Ssum=sum(sum(S));
for i = 1:length(K_vec)
         
	K=K_vec(i,1);
	error(i)=1-((sum(sum(S(1:i,1:i))))/(Ssum));

end




end








