# MATLAB-ODE-comparision
Comparison of a semi-implicit Runge-Kutta method with MATLAB solvers for stiff Ordinary Differential Equations. This was the course project for 06-606 (Computational Methods for Process Engineering) at Carnegie Mellon.

# Abstract

Some mathematically well behaved systems of Ordinary Differential Equations cannot be
solved with traditional algorithms without the use of extremely small step sizes. Such prob-
lems are characterized by the presence of terms that can lead to rapid variation in the
solutions i.e. terms that are on widely varying time scales. Such problems occur frequently
is areas such as reactor kinetics, distillation column modeling and atmospheric modeling.
Equation systems exhibiting such behavior are called "stiff".

To solve a stiff system with reasonable accuracy, the initial value algorithm used must exhibit
A-stable behavior or strongly A-stable behavior. Thus explicit RK methods cannot be used
because of their restricted absolute stability regions. Here, a semi-implicit Runge-Kutta
method developed by Michelsen is described. The method is used to solve various well-
known systems of stiff ODEs and the performance of the algorithm is compared to in-
built stiff and non-stiff solvers available in MATLAB (ode15s, ode23s and ode45). All
calculations were done on a Windows PC with an Intel i7 processor (2.90 GHz).

# References

[1] Michael L. Michelsen. An effcient general purpose method for the intergration of stiff
ordinary differential equations. AIChE Journal, 22(3):594 - 597, 1976.

[2] J.B. Caillaud and L. Padmanabhan. An improved semi-implicit runge-kutta method for
stiff systems. The Chemical Engineering Journal, 2(4):227 - 232, 1971.

[3] Lawrence F. Shampine and Mark W. Reichelt. The matlab ode suite. SIAM Journal on
Scientiffc Computing, 18(1):1{22, 1997.

[4] J.R. Dormand and P.J. Prince. A family of embedded runge-kutta formulae. Journal of
Computational and Applied Mathematics, 6(1):19 - 26, 1980.

[5] J. H. Seinfeld, Leon Lapidus, and Myungkyu Hwang. Review of numerical integration
techniques for stiff ordinary differential equations. Industrial & Engineering Chemistry
Fundamentals, 9(2):266 - 275, 1970.

[6] Richard C. Aiken and Leon Lapidus. An effective numerical integration method for
typical stiff systems. AIChE Journal, 20(2):368 - 375, 1974.

[7] Richard J. Field and Richard M. Noyes. Oscillations in chemical systems. iv. limit cycle
behavior in a model of a real chemical reaction. The Journal of Chemical Physics,
60(5):1877 - 1884, 1974.

[8] Robert J Gelinas. Stiff systems of kinetic equationsa practitioner's view. Journal of
Computational Physics, 9(2):222 - 236, 1972.

[9] Michael L. Michelsen. Application of semi-implicit rungekutta methods for integration of
ordinary and partial differential equations. The Chemical Engineering Journal, 14(2):107 - 112, 1977.
