function result = simpson38(a,b,f,n, tol)
h = (b-a)/(n-1);
x = a:h:b;
result = area(h,x,f);
end

function r = area(h,x,f)

r = 0;

for i=1:3:length(x)-1
    r = r + 3*h/8 * (f(x(i)) + 3*f(x(i+1)) + 3*f(x(i+2)) + f(x(i+3)));
end

end