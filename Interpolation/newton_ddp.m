function [ytop ycor] = newton_ddp(x, y, xcor)
% input
% x and y are a set of coordinates to interpolate
% xcor is a array of points to be evaluated by the resulting polynomial
% output
% ytop is an array containing the set of y coefficients
% ycor is an array of points evaluated using xcor

[yvalue ytop] = newton_findy(x,y);

for i=1:length(xcor)
    p = 0;
    
    vec_xdiff = [1, xcor(i) - x];
    vec_xdiff = vec_xdiff(1:end-1);
    
    prod_xdiff = cumprod(vec_xdiff);
    p = ytop * prod_xdiff.';

    ycor(i) = p;
end

end

% recursive function
% yvalue is the current top y value
% ytop is an array of y values [y0, y0y1, y0y1y2, y0y1y2y3]
function [yvalue ytop] = newton_findy(x,y)

l = length(y);
if  l == 2
    yvalue = (y(2) - y(1)) / (x(2) - x(1));
    ytop = [y(1) yvalue];
else
    [yvalue2 ytop2] = newton_findy(x(2:end), y(2:end));
    [yvalue1 ytop1] = newton_findy(x(1:end-1), y(1:end-1));
    yvalue = (yvalue2 - yvalue1) / x(end) - x(1);
    ytop = [ytop1 yvalue];
end

end
