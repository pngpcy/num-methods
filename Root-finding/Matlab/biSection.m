function [x, nsteps, table] = biSection(f, a, b, max, tol)
% This function uses Bisection method to find the root of an equation.
% [x, n,t ] = biSection (@(x) x^2-3, 1, 2,50, 0.01)

if nargin == 3
    max = 100;
    tol = 0.01;
end

table = {'i', 'a', 'b', 'f(a)', 'f(b)', 'c', 'f(c)', 'Update', '|f(c)|'};

for i=1:max
   c = (a + b)/2;
   table(i+1,:) = {i, a, b, f(a), f(b), c, f(c), 'a=c', nan};
   
   if f(c)*f(a) > 0
       a = c;
   else
       b = c;
       table{i+1, 8} = 'b=c';
   end    
   table{i+1, 9} = abs(f(c));
   
   if abs(f(c)) <= tol
       break;
   end
end

x = c;
nsteps = i;


