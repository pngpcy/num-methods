function x = gen_emp_con_dis(input)
% assume input is an array n x 1 of random variables
% output is an array of X values corresponding to the new uniform
% distribution

[r, c] = size(input);
x = zeros(r,1);

for i=1:r
    if input(i) < 0.2
        x(i) = 5/2 * input(i) + 3/10;
    elseif input(i) < 0.7
        x(i) = 7/5 * input(i) + 13/25;
    else
        x(i) = 10/3 * input(i) - 5/6;
    end
end


hold on;
[N,X] = hist(x,100);
xcor = linspace(0.3, 0.8, 100);
ycor = 0.2 / (0.8-0.3);
plot(xcor, ycor, 'r');
xcor1 = linspace(0.8, 1.5, 100);
ycor1 = 0.5 / (1.5-0.8);
plot(xcor1, ycor1, 'r');
xcor2 = linspace(1.5, 2.5, 100);
ycor2 = 0.3 / (2.5 - 1.5);
plot(xcor2, ycor2, 'r');
bar(X, N/(r/length(X)) / (max(x)-(min(x))), 'b');
hold off;