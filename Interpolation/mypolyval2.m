function poly = mypolyval2(p,x)

p = flipud(p);

poly = p(1) + p(2)*x;
power = x;
l = length(p);

for j=2:l-1
    power = x*power;
    poly = poly + p(j+1)*power;
end