%TEST1D test script for 1D integral approximation

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised July 12, 2025

% Test function
examp = 2;  % test function from fun1D.m

% Number of nodes
p = 1:8;
n = 2.^p;
ln = length(n);

% Parameters for the Jacobi weight
alpha = 0;
beta = 0;

% Reference value of the integral
[x,lambda] = nodesweights(512,alpha,beta);
f = fun1D(examp,x);
Iexact = lambda'*f;

% Tables with approximation value and errors
c1 = zeros(ln,1);
c2 = zeros(ln,1);

Gn = zeros(ln,1);
antiGn = zeros(ln,1);
GSn = zeros(ln,1);
avGn = zeros(ln,1);
avGnGSn = zeros(ln,1);

errg = zeros(ln,1);
errag = zeros(ln,1);
errgs = zeros(ln,1);
errav = zeros(ln,1);
erravgs = zeros(ln,1);

stimerr = zeros(ln,1);
stimerrs = zeros(ln,1);

% Strings and formats
tit1 = '  m       Gauss        anti-Gauss        G^*          Average       Average G^* \n';
dashes1 = '--------------------------------------------------------------------------------\n';
fmt1 = '%4d %14.10f %14.10f %14.10f %14.10f %14.10f';
tit2 = '  m       Gauss     anti-Gauss       G^*        Average    Average G^*    Estimate   Estimate G^* \n';
dashes2 = '--------------------------------------------------------------------------------------------------\n';
fmt2 = '%4d %+12.2e %+12.2e %+12.2e %+12.2e %+12.2e %+12.2e %+12.2e';

% Table for approximation value
fprintf('\nIntegral approximations \n')
fprintf(tit1)
fprintf(dashes1)
for i=1:ln
	Gn(i) = quadG1D(examp,n(i),alpha,beta);
	antiGn(i) = quadantiG1D(examp,n(i),alpha,beta);
	[GSn(i),c1(i),c2(i)] = quadGS1D(examp,n(i),alpha,beta);
	avGn(i) = (Gn(i)+antiGn(i))./2;
	avGnGSn(i) = c1(i)*Gn(i)+c2(i)*GSn(i);
	fprintf(fmt1,n(i),Gn(i),antiGn(i),GSn(i),avGn(i),avGnGSn(i))
	fprintf('\n')
end
fprintf(dashes1)

% Table for errors
fprintf('\nAbsolute errors \n')
fprintf(tit2)
fprintf(dashes2)
for i=1:ln
	errg(i) = Iexact-Gn(i);
	errag(i) = Iexact-antiGn(i);
	errgs(i) = Iexact-GSn(i);
	errav(i) = Iexact-avGn(i);
	erravgs(i) = Iexact-avGnGSn(i);
	stimerr(i) = (1/2)*(antiGn(i)-Gn(i));
	stimerrs(i) = c2(i)*(GSn(i)-Gn(i));
	fprintf(fmt2,n(i),errg(i),errag(i),errgs(i),errav(i),erravgs(i),stimerr(i),stimerrs(i))
	fprintf('\n')
end
fprintf(dashes2)

