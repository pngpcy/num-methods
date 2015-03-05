function ycor = lagrange_interp(x, y, xcor)

% calculate all the values of y coordinates based on xcor
for i=1:length(xcor)
    
    Lvalues = 0;
    % first calculate all the L values
    for j=1:length(x)
        % construct vector without the x value in numerator
        n = [x(1:j-1), x(j+1:end)];
        num = xcor(i) - n;
        denom = x(j) - n;
        Lvalues(j) =  prod(num) / prod(denom);
    end
    
    ycor(i) = y * Lvalues';
end

end