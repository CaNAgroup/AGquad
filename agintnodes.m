function flag = agintnodes(alpha,beta)
%AGINTNODES check if anti-Gauss nodes are internal to [-1,1]
%   flag = agintnodes(alpha,beta)
%   returns 1 if anti-Gauss nodes are in [-1,1], 0 if some of them might be
%   external to the interval, where
%      alpha, beta - exponents for the Jacobi weight (1-x)^alpha*(1+x)^beta

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

flag1 = (alpha+beta+2);
flag2 = (alpha+beta)*(alpha+beta+1);
flag = (alpha>=-.5) && (beta>=-.5);
flag = flag && ((2*alpha+1)*flag1+.5*(alpha+1)*flag2>=0);
flag = flag && ((2*beta+1)*flag1+.5*(beta+1)*flag2>=0);

