function f = fun2D(examp,x,y)
%FUN2D evaluate the test function f at points x and y
%   f = fun2D(examp,x)
%   where
%      examp - index of the test integrand function
%      x,y   - evaluation points

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

if isstring(examp)
	f = eval(examp);
else
	switch examp
		case 1
			f = abs(sin(1-x)).^(9/2).*(1+x+y);
		case 2
			f = x.*abs(cos(1/2-x)).^(3/2)+y.*abs(sin(1+y)).^(3/2);
		case 3
			f = exp(1+x+y).*abs(x-1).^(7/2);
		otherwise
			error('Unknown test function.')
	end
end

