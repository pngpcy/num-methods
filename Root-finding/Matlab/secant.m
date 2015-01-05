function [x, nsteps] = secant (f, a, b, nmax, tol)
% This function uses secant method to find the root of an equation.
% [x, n] = secant (@(x) x^2-3, 1, 2, 10, 0.01)

X = [a b];

if nargin == 3
    nmax = 100;
    tol = 0.01;
end

for n=1:nmax
    X(n+2) = (X(n) * f(X(n+1)) - X(n+1) * f(X(n))) / (f(X(n+1)) - f(X(n)));
    c = abs(f(X(n+2)));
    
    if c < tol
        break 
    end
end

x = X(end);
nsteps = n;