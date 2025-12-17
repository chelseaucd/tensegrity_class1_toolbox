%% Eigen_Decomposition_and_Similarity_Transform.m
% ---------------------------------------------------------------
%   Perform eigen-decomposition of a symmetric matrix E,
%   verify eigenvector sign symmetry, and apply a similarity
%   transformation to analyze how eigenvectors affect another
%   matrix (here, a simple diagonal-like matrix with a single
%   nonzero element).
% ---------------------------------------------------------------
% Define symmetric matrix E
E = [0, -0.5, -0.5, 1.0;
     -0.5, 0, 1, -0.5;
     -0.5, 1, 0, -0.5;
     1, -0.5, -0.5, 0];

% Compute eigenvectors (phi) and eigenvalues (lambda)
[phi, lambda] = eig(E);

% Display eigenvectors
disp('Eigenvectors (phi):');
disp(phi);
