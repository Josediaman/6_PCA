



%% ................................................
%% ................................................
%%  PCA
%% ................................................
%% ................................................





%% 1. Clear and Close Figures
clear ; close all; clc





%% ==================== Part 1: Data ====================
fprintf('\n \nDATA\n.... \n \n \n');   





%% 2. Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add your own file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('Loading data ...\n'); 
%%%%%%********Select archive********   
load ('ex3data1.mat');
m = size(X, 1);
fprintf('(X) (10 items)\n');   
[X(1:10,1:3)]
fprintf('Program paused. Press enter to continue. \n \n \n');
pause;


%% 5. Normalizing Features 
fprintf('Normalizing Features ...\n');
[X_norm, mu, sigma] = featureNormalize(X);
X_norm=X_norm(:,sigma!=0);
[m, n] = size(X); 
fprintf('X_norm (normal) (10 items)\n');
X_norm(1:10,1:3)
fprintf('Program paused. Press enter to continue.\n \n \n \n');
pause;





%% =========== Part 2: Training PCA===============
fprintf('TRAINING PCA \n...............\n \n \n \n');





%% 6. Initial values
%%%%%%********Select K (final dimensions)********   
K = 166;


%% 7. Run PCA
[U, S] = pca(X_norm);
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
fprintf('Done!!\n\n');
fprintf('Program paused. Press enter to continue.\n');
pause;





%% =========== Part 3: Results ===============
fprintf('\n \n \n \n RESULTS\n........\n \n \n \n');





fprintf('Clasification (Xnorm  Xaprox Z(new values)) "5 values"...\n \n');
for i = 1:5,
fprintf('x=');
fprintf('\n %f',X_norm(i,1:3));
fprintf('\n');
fprintf('x_aprox= ');
fprintf('\n %f',X_rec(i,1:3));
fprintf('\n');
fprintf('z=');
fprintf('\n %f',Z(i,1:1));
fprintf('\n\n\n');
endfor
fprintf('Program paused. Press enter to continue.\n');
pause;





if(size(X,2)==2)
%% ================ Part 2': GRAPHIC ================
fprintf('\n\n\n\nGRAPHIC \n...... \n \n \n \n');





plot(X_norm(:, 1), X_norm(:, 2), 'bo');
hold on;
plot(X_rec(:, 1), X_rec(:, 2), 'ro');
for i = 1:size(X_norm, 1)
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);
end
hold off
fprintf('\nX_norm = Blue points\n');
fprintf('X_approx = Red points\n\n\n');
fprintf('Program paused. Press enter to continue.\n');
pause;
endif






%% ================ Part 5: Validation ================
fprintf('\n\nVALIDATION\n.......... \n \n \n \n');




[K_vec, error] = ...
    validationCurve(S,size(X_norm,2));

figure;
plot(K_vec, error);
xlabel('K');
ylabel('Error');
fprintf('K\t\tError\n');
for i = 1:length(K_vec)
	fprintf(' %f\t%f\n', ...
            K_vec(i), error(i));
end

fprintf('\n Actual K: \n');
fprintf(' %f \n', K);
fprintf('\nThe best K has the first with 99/95/90 variance retained (error<0.01/0.05/0.1).\n\n');
fprintf('Program paused. Press enter to continue.\n');
pause;
















