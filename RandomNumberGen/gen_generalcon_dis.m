function x = gen_generalcon_dis(input)

[r, c] = size(input);

f = [30 -60 30 0 0];
f1 = [120 -180 60 0];
f1_roots = roots(f1);
y_of_roots = polyval(f, f1_roots);
max_value = max(y_of_roots);

for i=1:r-1
    if input(i+1) <= (polyval(f, input(i))/max_value)
        x(i) = input(i);
    end
    
end

x=x(x~=0);  % can use y = nonzeros(x);
hold on;
[N, X] = hist(x,30);
bar(X, N/(sum(N)/length(X)) / (max(x)-min(x)), 'b');
%bar(X, N/(sum(N)), 'b');
%bar(X, N / (trapz(X, N) + 0.5*(X(2) - X(1)) * (N(1)+ N(end))),1);


ycor = polyval(f, X);

plot(X, ycor, 'r');


