function [x, nsteps] = newton (f, df, Xn, nmax, tol)
% This function uses Newton method to find the root of an equation.
% [x, n] = newton (@(x) x^2-3, @(y) 2*y, 1, 10, 0.01)

X = [Xn];

if nargin == 3
    nmax = 100;
    tol = 0.01;
end

for n=1:nmax
    X(n+1) = X(n) - f(X(n))/df(X(n));
    c = abs(f(X(n+1)));
    
    if c < tol
        break
    end
    
end

x = X(n+1);
nsteps = n;
