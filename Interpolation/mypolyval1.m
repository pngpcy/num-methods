function poly = mypolyval1(p,x)

l = length(p);
p = flipud(p);
poly = p(1);

for j=1:l-1
    poly = poly + p(j+1)*(x^j);
end
