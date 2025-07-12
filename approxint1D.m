%APPROXINT1D auxiliary function for 1D integral approximation

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

show = 10;

Iexact = quadG1D(examp,nexact,alpha,beta);
Gn = quadG1D(examp,n,alpha,beta);
antiGn = quadantiG1D(examp,n,alpha,beta);
[GSn,c1,c2] = quadGS1D(examp,n,alpha,beta);

Av = (Gn+antiGn)/2;
avGnGSn = c1*Gn+c2*GSn;

err = Iexact-Gn;
erra = Iexact-antiGn;
errgs = Iexact-GSn;
errav = Iexact-Av;
erravgs = Iexact-avGnGSn;

stimerr = (1/2)*(antiGn-Gn);
stimerrs = c2*(GSn-Gn);

str = sprintf('1D INTEGRAL APROXIMATION');
str = [str sprintf('\n\nExample: %g',examp)];
str = [str sprintf('\nn= ')];
str = [str sprintf('%g ', n)];
str = [str sprintf('\nalpha= ')];
str = [str sprintf('%g ', alpha)];
str = [str sprintf('\nbeta= ')];
str = [str sprintf('%g ', beta)];
str = [str sprintf(['\n\nExact Integral Value: ' ...
    '%.15f \n'],Iexact)];
str = [str sprintf(['\nInt. Approx. with Gauss quadrature: ' ...
    '%.15f'],Gn)];
str = [str sprintf(['\nInt. Approx. with anti-Gauss quadrature: ' ...
    '%.15f'],antiGn)];
str = [str sprintf(['\nInt. Approx. with G* quadrature: ' ...
    '%.15f'],GSn)];
str = [str sprintf(['\nInt. Approx. with Averaged quadrature: ' ...
    '%.15f'],Av)];
str = [str sprintf(['\nInt. Approx. with Generalized Averaged quadrature: ' ...
    '%.15f'],avGnGSn)];
str = [str sprintf(['\n\nError with Gauss quadrature: ' ...
    '%.4d'],err)];
str = [str sprintf(['\nError with anti-Gauss quadrature: ' ...
    '%.4d'],errgs)];
str = [str sprintf(['\nError with G* quadrature: ' ...
    '%.4d'],erra)];
str = [str sprintf(['\nError with Averaged quadrature: ' ...
    '%.4d'],errav)];
str = [str sprintf(['\nError with Genelarized Averaged quadrature: ' ...
    '%.4d \n'],erravgs)];
str = [str sprintf(['\nEstimate for Gauss error with Averaged quadrature: ' ...
    '%.4d'],stimerr)];
str = [str sprintf(['\nEstimate for Gauss error with Genelarized Average quadrature: ' ...
    '%.4d \n'],stimerrs)];
str = [str sprintf('--------------------------------------------------------------')];
guiprint(str, calledbyapp, textarea)

guiplot1D(examp,show);

