function result = simpson13(a,b,f,n)

h = (b-a)/(n-1);
x = a:h:b;
result = area(h,x,f);
end


function r = area(h,x,f)

r = 0;

for i=1:2:length(x)-1
    r = r + h/3 * (f(x(i)) + 4*f(x(i+1)) + f(x(i+2)));
end

end