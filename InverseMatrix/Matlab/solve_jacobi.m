function [x_results nsteps]= solve_jacobi(a, b, tol)
% this function find root using gaussian elimination
% it first reduces matrix a to triangular form
% then calls function solve_triangular (back substitution) to find x
% [ans_r steps] = solve_jacobi([7 3 -1 2;3 8 1 -4;-1 1 4 -1; 2 -4 -1 6],[-1 0 -3 1].', 0.001)

%a = [5 -2 3;-3 9 1; 2 -1 7];
%b = [-1 2 3].';
%tol = 0.001;

[len_r len_c] = size(b);
x = zeros(len_r, len_c);

% store all the iterations of x
x_results = x;
j=2;

% A = D+R where D is the diagonals of A and R contains all other elements
% except the diagonals of A
R = a;
% zero out the diagonals
R(1:len_r + 1:end) = 0;

while (true)
    for i=1:len_r
        x(i,1) = (1/a(i,i)) * (b(i,1) - (R(i,:) * x_results(1:end,end)));
    end
    
    cov = norm ((x) - x_results(1:end,end)); 
    
    % store the last result
    x_results(:,j) = x;
    
    if (cov<tol)
        break;
    end
    
    % increase iteration
    j = j+1;
    
end

% number of iterations
nsteps = j-1;
