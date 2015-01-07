function x =  solve_upper(a,b)
% solving triangular systems
% given ax = b, where a is a square matrix and b is a nx1 matrix
% find x where x is a nx1 matrix
% solve_upper([-2 1 2 1;0 3 -2 1; 0 0 5 1; 0 0 0 1],[9 -1 8 2])

[len len_c] = size(a);

% preallocate memory
x = zeros(len,1);

% calculate backward from xn to ... to x2 to x1
for i=len:-1:1
    % xn = bn minus (sum of (xn * coefficient ... xn+1 * cofficient)
    % divided by cofficient of xn
    x(i,1) = (b(i) - a(i,i+1:end)*x(i+1:end))/a(i,i);
end
