function f = fun1D(examp,x)
%FUN1D evaluate the test function f at points x
%   f = fun1D(examp,x)
%   where
%      examp - index of the test integrand function
%      x     - evaluation points

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

if isstring(examp)
	f = eval(examp);
else
	switch examp
		case 1
			f = exp(x).*(x+5);
		case 2
			f = abs(sin(1-x)).^(9/2);
		case 3
			f = x.*abs(cos(1/2-x)).^(3/2);
		case 4
			f = abs(x-1).^(3/2).*sin(x);
		otherwise
			error('Unknown test function.')
	end
end

