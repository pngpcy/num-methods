function x =  solve_lower(a,b)
% solving triangular systems
% given ax = b, where a is a square matrix and b is a nx1 matrix
% find x where x is a nx1 matrix
% solve_lower([-2 0 0 0;1 3 0 0; 5 1 5 0; 1 2 1 3],[9 -1 8 2])

[len len_cl] = size(a);

% preallocate memory
x = zeros(len,1);

% calculate backward from xn to ... to x2 to x1
for i=1:len
    % xn = bn minus (sum of (xn * coefficient ... xn+1 * cofficient)
    % divided by cofficient of xn
    x(i,1) = (b(i) - a(i,1:i-1)*x(1:i-1))/a(i,i);
end
