function ycor = linear_spline(x, y, xcor)

for j=1:length(xcor)
    
    % find the interval where xcor is last lesser than x(i)
    for i=2:length(x)
        if xcor(j) <= x(i)
            i = i-1;
            break;
        end
    end

    ycor(j) = y(i) + ((y(i+1) - y(i)) / (x(i+1) - x(i))) ...
        * (xcor(j) - x(i));
    
end

end
