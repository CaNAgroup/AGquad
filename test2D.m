%TEST2D test script for 2D integral approximation

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised July 12, 2025

% Test function
examp = 2;  % test function from fun2D.m

% Number of nodes
p = 1:8;
n1 = 2.^p;
n2 = 2.^p;
ln1 = length(n1);
if isscalar(n2)
	n2 = n2.*ones(1,length(n1));
end

% Parameters for the Jacobi weight
alpha1 = 0;
beta1 = 0;
alpha2 = 0;
beta2= 0;

% Reference value of the integral
[x,lambda1] = nodesweights(512,alpha1,beta1);
[y,lambda2] = nodesweights(512,alpha2,beta2);
[X, Y] = meshgrid(x',y');
f = fun2D(examp,X,Y);
Iexact = lambda1'*(lambda2'*f)';

% Tables with approximation value and errors
c1 = zeros(ln1,1);
c2 = zeros(ln1,1);

Gn = zeros(ln1,1);
antiGn = zeros(ln1,1);
avGn = zeros(ln1,1);

errg = zeros(ln1,1);
errag = zeros(ln1,1);
errav = zeros(ln1,1);

stimerr = zeros(ln1,1);

% Strings and formats
tit1 = ' n1     n2       Gauss        anti-Gauss      Average \n';
dashes1 = '---------------------------------------------------------\n';
fmt1 = '%4d %6d %14.10f %14.10f %14.10f';
tit2 = ' n1     n2       Gauss     anti-Gauss     Average      Estimate \n';
dashes2 = '----------------------------------------------------------------\n';
fmt2 = '%4d %6d %+12.2e %+12.2e %+12.2e %+12.2e %+12.2e';

% Table for approximation value
fprintf('\nIntegral approximations \n')
fprintf(tit1)
fprintf(dashes1)
for i=1:ln1
	Gn(i) = quadG2D(examp,n1(i),n2(i),alpha1,beta1,alpha2,beta2);
	antiGn(i) = quadantiG2D(examp,n1(i),n2(i),alpha1,beta1,alpha2,beta2);
	avGn(i) = (Gn(i)+antiGn(i))./2;
	fprintf(fmt1,n1(i),n2(i),Gn(i),antiGn(i),avGn(i))
	fprintf('\n')
end
fprintf(dashes1)

% Table for errors
fprintf('\nAbsolute errors \n')
fprintf(tit2)
fprintf(dashes2)
for i=1:ln1
	errg(i) = Iexact-Gn(i);
	errag(i) = Iexact-antiGn(i);
	errav(i) = Iexact-avGn(i);
	stimerr(i) = (1/2)*(antiGn(i)-Gn(i));
	fprintf(fmt2,n1(i),n2(i),errg(i),errag(i),errav(i),stimerr(i))
	fprintf('\n')
end
fprintf(dashes2)

