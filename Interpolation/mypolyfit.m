function result = mypolyfit(x,y)
% expect y to be nx1 form

% create vandermonde matrix
m = vander(x);

[r c] = size(y);
if r < c
    y = y';
end

result = m\y;
