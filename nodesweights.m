function [x,lambda,c1,c2] = nodesweights(n,alpha,beta,id)
%NODESWEIGTHS nodes and weights for Gauss, anti-Gauss, and G^* rules
%   [x,lambda] = nodesweights(n,alpha,beta,id)
%   returns weights and nodes x, lambda for the Gauss, anti-Gauss, and
%   G^* rules where
%      n           - number of quadrature nodes, n for the Gauss and n+1
%                    for anti-Gauss and G^* rules
%      alpha, beta - exponents for the Jacobi weight (1-x)^alpha*(1+x)^beta
%      id          - 1 Gauss rule, 2 anti-Gauss rule, 3 G^* rule
%   For G^* rule, also return coefficients c1 and c2.

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised July 12, 2025

if nargin < 4
	id = 1;
end

c1 = [];
c2 = [];

% Coefficients
if (alpha==0) && (beta==0)
	vk = [1:n+1]';
	muzero = 2;
	a = zeros(n+1,1);
	b = vk.^2./(4*vk.^2-1);
elseif (alpha==-1/2) && (beta==-1/2)
	muzero = pi;
	a = zeros(n+1,1);
	b = [1/2; ones(n,1)/4];
elseif (alpha==1/2) && (beta==1/2)
	muzero = pi/2;
	a = zeros(n+1,1);
	b = ones(n+1,1)/4;
else
	a = zeros(n+1,1);
	b = zeros(n,1);
	ab = alpha + beta;
	abi = 2.0 + ab;
	muzero = 2.0^(ab+1.)*gamma(alpha+1)*gamma(beta+1) / gamma(abi);
	a(1) = (beta - alpha)/abi;
	b(1) = 4.0*(1.0 + alpha)*(1.0 + beta)/((abi + 1.0)*abi*abi);
	a2b2 = beta*beta - alpha*alpha;
	for  i = 2:n+1
		abi = 2.0*i + ab;
		a(i) = a2b2/((abi - 2.0)*abi);
		b(i) = 4*i*(i+alpha)*(i+beta)*(i+ab)/((abi*abi-1)*abi*abi);
	end
	abi = 2.0*(n+1) + ab;
	a(n+1) = a2b2/((abi - 2.0)*abi);
end

bs = sqrt(b);

switch id
	case 1  % Gauss 
		% Gauss matrix
		J = diag(a(1:n))+diag(bs(1:n-1),1)+diag(bs(1:n-1),-1);

		% Gauss nodes and weights
		[U, D] = eig(J);
		x = diag(D);
		lambda = U(1,:)'.^2.*muzero;

	case 2  % anti-Gauss 
		bs(n) = sqrt(2)*bs(n);	% for anti-Gauss

		% anti-Gauss matrix
		Ja = diag(a(1:n+1))+diag(bs(1:n),1)+diag(bs(1:n),-1);

		% anti-Gauss nodes and weights
		[Ua, Da] = eig(Ja);
		x = diag(Da) ;
		lambda = Ua(1,:)'.^2.*muzero;

		if ~agintnodes(alpha,beta)
			warning('Some anti-Gauss nodes might be external to [-1,1].')
		end

	case 3  % G^* 
		bb = [bs(1:n-1);sqrt(b(n)+b(n+1))]; % for the generalized

		c1 = b(n+1)/(b(n)+b(n+1));
		c2 = b(n)/(b(n)+b(n+1));

		% G^* matrix
		Jg = diag(a(1:n+1))+diag(bb(1:n),1)+diag(bb(1:n),-1);

		% G^* nodes and weights
		[Ug, Dg] = eig(Jg);
		x = diag(Dg) ;
		lambda = Ug(1,:)'.^2.*muzero;

end

