function [x, nsteps] = biSection(f, a, b, max, tol)
% This function uses Bisection method to find the root of an equation.
% [x, n] = biSection (@(x) x^2-3, 1, 2,50, 0.01)

if nargin == 3
    max = 100;
    tol = 0.01;
end

for i=1:max
   c = (a + b)/2;
   
   if f(c)*f(a) > 0
       a = c;
   else
       b = c;
   end    
   
   if abs(f(c)) <= tol
       break;
   end
end

x = (a+b)/2;
nsteps = i;


