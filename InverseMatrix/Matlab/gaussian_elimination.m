function[A b]=gaussian_elimination(A,b)
% this function reduces matrix to upper triangular form
% using gaussian elimination
% gaussian_elimination([7 3 -1 2;3 8 1 -4;-1 1 4 -1; 2 -4 -1 6],[-1 0 -3 1].')

[row_A col_A] = size(A);
[row_b col_b] = size(b);

if row_A ~= row_b || row_A ~= col_A
    error('Input error')
else
    A_aug = [A b];
    for i = 1:1:row_A-1
        for j = row_A : -1: i+1
            fact = (A_aug(j,i)/A_aug(i,i));
            A_aug(j,i:end) = A_aug(j,i:end) - fact*A_aug(i,i:end);
        end
    end
end
A = A_aug(:,1:col_A); 
b = A_aug(:,end);
