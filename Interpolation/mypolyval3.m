function y = mypolyval3(p,x)
% expect p and x to be n x 1 form

[r c] = size(p);
if r < c
    p = p';
end

[r c] = size(x);
if r < c
    x = x';
end

p = flipud(p);

l = length(x);
y = ones(l,1) * p(end);
l = length(p);

for j=l-1:-1:1
    y = p(j) + x.*y;
end

