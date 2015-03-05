function [result] = trapezoid(a,b,f,n)
    h = (b-a)/(n-1);
    x = a:h:b;
    result = area(h,x,f);
end


function r = area(h,x,f)

r = 0;
   
for i = 2:length(x)-1
    r = r + (2 * f(x(i)));
end

r = h/2 * (f(x(1)) + r + f(x(end)));    

end