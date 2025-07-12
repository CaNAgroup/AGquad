
AGquad MATLAB package
=====================

AUTHORS
-------

Patricia Díaz de Alba, Luisa Fermo, Giuseppe Rodriguez
       University of Cagliari, Italy
Email: patricia.diazda@unica.it; fermo@unica.it; rodriguez@unica.it


REFERENCES
----------

P. Díaz de Alba, L. Fermo, and G. Rodriguez
AGquad: a MATLAB package for 1D and 2D anti-Gauss rules.
Submitted.
https://doi.org/...
      
P. Díaz de Alba, L. Fermo, and G. Rodriguez
Anti-Gauss cubature rules with applications to Fredholm integral equations on the square.
SIAM Journal of Scientific Computing, 47(2): A689-A712, 2025.
https://doi.org/10.1137/24M1631432

P. Díaz de Alba, L. Fermo, and G. Rodriguez
Solution of second-kind Fredholm integral equations by means of Gauss and anti-Gauss quadrature rules.
Numerische Mathematik, 146(4): 699-728, 2020.
https://doi.org/10.1007/s00211-020-01163-7


DESCRIPTION
-----------

This MATLAB package has been developed for the approximation of 1D 
and 2D integrals using anti-Gauss quadrature rules. 

The package implements these rules for both one-dimensional and two-dimensional
integrals, offering an easy-to-use Graphical User Interface (GUI).

With the exception of the GUI, the software also runs on OCTAVE.

See the help page for each function, for the calling syntax.

Software revision date: V1.0, March 2025

Software language: Matlab 24.2 (R2024b)


INSTALLATION
------------

When the archive file containing the package is uncompressed, it creates a
directory named AGquad. In order to use the package outside this directory,
its name must be added to the Matlab search path, either by the "addpath"
command, or using the menus available in the graphical user interface.


PACKAGE USE
-----------

Once the package is correctly added to the path, the Test scripts should run
without errors.


PACKAGE STRUCTURE
-----------------

The main AGquad directory contains the following files:

Computational Routines
-   nodesweights 	- nodes and weights for Gauss, anti-Gauss and G^* rules
-   quadG1D 		- Gauss quadrature for an integral on [-1,1]
-   quadGS1D        	- G^* quadrature for an integral on [-1,1]
-   quadG2D 		- Gauss cubature for an integral on [-1,1]x[-1,1]
-   quadantiG1D 	- anti-Gauss quadrature for an integral on [-1,1]
-   quadantiG2D 	- anti-Gauss cubature for an integral on [-1,1]x[-1,1]
-   AGquadGUI 		- GUI for 1D and 2D integral approximation

Test scripts
-   test1D 		- test script for 1D integral approximation
-   test2D 		- test script for 2D integral approximation

Auxiliary Routines
-   agintnodes 		- check if anti-Gauss nodes are internal to [-1,1]
-   fun1D 		- evaluate the test function f at points x
-   fun2D 		- evaluate the test function f at points x and y
-   guiplot1D 		- plot the 1D integrand function
-   guiplot2D 		- plot the 2D integrand function
-   guiprint 		- auxiliary output routine

Auxiliary files
-   information.pdf	- file displayed by AGquadGUI
-   approxint1D 	- auxiliary function for 1D integral approximation
-   approxint2D 	- auxiliary function for 2D integral approximation

  

PACKAGE UPDATES
---------------

AGquad updates will be available at the web page:
http://bugs.unica.it/cana/software/

