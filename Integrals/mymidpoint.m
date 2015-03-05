function result = mymidpoint(a,b,f,n)

h = (b-a)/(n-1);
x = a:h:b;
result = area(h,x,f);
end


function r = area(h,x,f)

r = 0;

for i=1:length(x)-1
    r = r + h * (f(x(i) + h/2));
end

end