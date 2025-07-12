function antiGn = quadantiG2D(examp,m,n,alpha1,beta1,alpha2,beta2)
%QUADANTIG2D anti-Gauss cubature for an integral on [-1,1]x[-1,1] 
%   antiGn = quadantiG2D(examp,m,n,alpha1,beta1,alpha2,beta2)
%   returns the approximate integral value, where
%   where
%      examp       - index of the test integrand function 
%      m           - number of quadrature nodes on the x axis
%      n           - number of quadrature nodes on the y axis
%      alpha1, beta1 - exponents for the Jacobi weight (1-x)^alpha1*(1+x)^beta1
%      alpha2, beta2 - exponents for the Jacobi weight (1-y)^alpha2*(1+y)^beta2

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

[x1,lambda1] = nodesweights(m,alpha1,beta1,2);
[x2,lambda2] = nodesweights(n,alpha2,beta2,2);
[X, Y] = meshgrid(x1',x2');
f = fun2D(examp,X,Y);
antiGn = lambda1'*(lambda2'*f)';

