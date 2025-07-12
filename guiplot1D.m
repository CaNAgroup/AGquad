function h = guiplot1D(examp,fig)
%GUIPLOT1D plot the 1D integrand function
%   h = guiplot1D(examp,fig)
%   where
%      examp - index of the test integrand function 
%      fig   - figure for the plot

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

figure(fig)
set(gcf,'NumberTitle','off','name','1D Integrand Function');
x = linspace(-1,1,1000);
f = fun1D(examp,x);

hH = plot(x,f);
grid on
xlabel('x','fontsize',11)
ylabel('f(x)','fontsize',11)

h = hH;

