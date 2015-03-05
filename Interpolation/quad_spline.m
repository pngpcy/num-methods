function ycor = quad_spline(x, y, xcor)

l = length(x);

% n+1 points. 
n = l-1;

% pre-allocate memory for matrix
m = zeros(3*n);
b = zeros(3*n,1);

% fill in details about f(x) first
j=1;  % start with column 1 first
for i = 1:2:2*n
    m(i,j) = x(j)^2;
    m(i,j+n) = x(j);
    m(i,j+2*n) = 1;
    b(i) = y(j);
    
    m(i+1,j) = x(j+1)^2;
    m(i+1,j+n) = x(j+1);
    m(i+1,j+2*n) = 1;
    b(i+1) = y(j+1);
    
    % shift by 1 column
    j = j+1;
end

% fill in details about f'(x) second
j=1;
% continue using the row index from previous
i = i+2;
for k = 1:n-1
    m(i,j) = 2*x(j+1);
    m(i,j+1) = -2*x(j+1);
    m(i,j+n) = 1;
    m(i,j+n+1) = -1;
    j = j+1;
    i = i+1;
end

% last row
m(end,1) = 1;

%derive coefficients
co = m\b;

for j=1:length(xcor)
    
    % find the interval where xcor is last lesser than x(i)
    for i=2:length(x)
        if xcor(j) <= x(i)
            i = i-1;
            break;
        end
    end

    ycor(j) = co(i) * xcor(j)^2 + co(i+n) * xcor(j) + co(i+2*n);
    
end

end