function [x, nsteps] = muller (f, X1, X2, X3, nmax, tol)
% This function uses false position method to find the root of an equation.
% [x, n] = muller (@(x) x^2-3, -1, 1, 3, 10, 0.01)

X = [X1 X2 X3];

for n=1:nmax
    vandermonde_matrix = vander(X - X(2));
    right_matrix = (arrayfun(f,X))';
    
    middle_matrix = vandermonde_matrix\right_matrix;
    
    a = middle_matrix(1);
    b = middle_matrix(2);
    c = middle_matrix(3);
    
    temp = X(2) + ((-2*c) / (b + (sign(b) * sqrt(b^2 - 4 * a * c ) ) ) );
    
    X = [X(2) X(3)  temp];
    
    if abs(f(temp)) < tol
        break;
    end
    
end

x = temp;
nsteps = n;
