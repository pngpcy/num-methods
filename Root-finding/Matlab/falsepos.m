function [x, nsteps] = falsepos (f, a, b, nmax, tol)
% This function uses false position method to find the root of an equation.
% [x, n] = falsepos (@(x) x^2-3, 1, 2, 10, 0.01)

if nargin == 3
    nmax = 100;
    tol = 0.01;
end

for i=1:nmax
    c = (a*f(b)-b*f(a)) / (f(b) - f(a));
   
    if f(a)*f(c) > 0
        a = c;
    else
        b = c;
    end
   
    if abs(f(c)) < tol
        break;
    end
    
end

c = (a*f(b)-b*f(a)) / (f(b) - f(a));
x = c;
nsteps = i;
