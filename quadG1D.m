function Gn = quadG1D(examp,n,alpha,beta)
%QUADG1D Gauss quadrature for an integral on [-1,1] 
%   Gn = quadG1D(examp,n,alpha,beta)
%   returns the approximate integral value, where
%      examp       - index of the test integrand function 
%      n           - number of quadrature nodes, n for the Gauss and n+1 
%                    for the anti-Gauss rules
%      alpha, beta - exponents for the Jacobi weight (1-x)^alpha*(1+x)^beta

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

[x,lambda] = nodesweights(n,alpha,beta,1);
f = fun1D(examp,x);
Gn = lambda'*f;

