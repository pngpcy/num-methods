function [L U x] = solve_LU(a,b)
% this function decompose a matrix via the LU decomposition method
% solve_LU([7 3 -1 2;3 8 1 -4;-1 1 4 -1; 2 -4 -1 6],[-1 0 -3 1].')

% a = [2 6 2;-3 -8 0;4 9 2];
% b = [-1 -7 -6].';

[len_r len_c] = size(a);

% make sure it is a square matrix
if len_r == len_c
    
    % initialise both L and U
    L = zeros(len_r);
    % set the diagonals to 1
    L(1:len_r+1:end) = 1;
    
    U = zeros(len_r);
    % set first row of U to the first row of a
    U(1,:) = a(1,:);
    
    for j = 1:len_c
        for i = 2:len_r
            if i <= j
                % calculate beta (U)
                U(i,j) = a(i,j) - L(i,1:i-1)*U(1:i-1,j);
            else
                % calculate alpha (L)
                L(i,j) = (a(i,j) - L(i,1:j-1)*U(1:j-1,j)) / U(j,j); 
            end
        end
    end
    
else
    L = nan;
    U = nan;
end

% Ax = b; LUx = b; Ux = y; Ly = b
y = solve_lower(L,b);
x = solve_upper(U, y);


