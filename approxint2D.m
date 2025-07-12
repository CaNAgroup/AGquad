%APPROXINT2D auxiliary function for 2D integral approximation

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

show = 10;

Iexact = quadG2D(examp,nexact,nexact,alpha1,beta1,alpha2,beta2);
Gn = quadG2D(examp,m,n,alpha1,beta1,alpha2,beta2);
antiGn = quadantiG2D(examp,m,n,alpha1,beta1,alpha2,beta2);

Av = (Gn+antiGn)/2;

err = Iexact-Gn;
erra = Iexact-antiGn;
errav = Iexact-Av;

stimerr = (1/2)*(antiGn-Gn);

str = sprintf('2D INTEGRAL APROXIMATION');
str = [str sprintf('\n\nExample: %g',examp)];
str = [str sprintf('\nn1= ')];
str = [str sprintf('%g ', m)];
str = [str sprintf('\nn2= ')];
str = [str sprintf('%g ', n)];
str = [str sprintf('\nalpha1= ')];
str = [str sprintf('%g ', alpha1)];
str = [str sprintf('\nbeta1= ')];
str = [str sprintf('%g ', beta1)];
str = [str sprintf('\nalpha2= ')];
str = [str sprintf('%g ', alpha2)];
str = [str sprintf('\nbeta2= ')];
str = [str sprintf('%g ', beta2)];

str = [str sprintf(['\n\nExact Integral Value: ' ...
    '%.15f \n'],Iexact)];
str = [str sprintf(['\nInt. Approx. with Gauss quadrature: ' ...
    '%.15f'],Gn)];
str = [str sprintf(['\nInt. Approx. with anti-Gauss quadrature: ' ...
    '%.15f'],antiGn)];
str = [str sprintf(['\nInt. Approx. with Averaged quadrature: ' ...
    '%.15f'],Av)];
str = [str sprintf(['\n\nError with Gauss quadrature: ' ...
    '%.4d'],err)];
str = [str sprintf(['\nError with anti-Gauss quadrature: ' ...
    '%.4d'],erra)];
str = [str sprintf(['\nError with Average quadrature: ' ...
    '%.4d \n'],errav)];
str = [str sprintf(['\nEstimate for Gauss error with Averaged quadrature: ' ...
    '%.4d \n'],stimerr)];
str = [str sprintf('--------------------------------------------------------------')];
guiprint( str, calledbyapp, textarea)

guiplot2D(examp,show);

