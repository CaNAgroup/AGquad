function h = guiplot2D(examp,fig)
%GUIPLOT2D plot the 2D integrand function
%   h = guiplot2D(examp,fig)
%   where
%      examp - index of the test integrand function 
%      fig   - figure for the plot

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

figure(fig)
set(gcf,'NumberTitle','off','name','2D Integrand Function');
[X,Y] = meshgrid(-1:.1:1);
f = fun2D(examp,X,Y);

hh = surf(X,Y,f);
grid on
xlabel('x','fontsize',11)
ylabel('y','fontsize',11)
zlabel('f(x,y)','fontsize',11)

h = hh;

