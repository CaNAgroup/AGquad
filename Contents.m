% AGquad
%   P. Díaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
% Computational Routines
%   nodesweights    - nodes and weights for Gauss, anti-Gauss and G^* rules
%   quadG1D         - Gauss quadrature for an integral on [-1,1]
%   quadGS1D        - G^* quadrature for an integral on [-1,1]
%   quadG2D         - Gauss cubature for an integral on [-1,1]x[-1,1]
%   quadantiG1D     - anti-Gauss quadrature for an integral on [-1,1]
%   quadantiG2D     - anti-Gauss cubature for an integral on [-1,1]x[-1,1]
%   AGquadGUI       - GUI for 1D and 2D integral approximation
%
% Test scripts
%   test1D          - test script for 1D integral approximation
%   test2D          - test script for 2D integral approximation
%
% Auxiliary Routines
%   agintnodes      - check if anti-Gauss nodes are internal to [-1,1]
%   fun1D           - evaluate the test function f at points x
%   fun2D           - evaluate the test function f at points x and y
%   guiplot1D       - plot the 1D integrand function
%   guiplot2D       - plot the 2D integrand function
%   guiprint        - auxiliary output routine
%   
% Auxiliary files
%   information.pdf - file displayed by AGquadGUI
%   approxint1D     - auxiliary function for 1D integral approximation
%   approxint2D     - auxiliary function for 2D integral approximation

