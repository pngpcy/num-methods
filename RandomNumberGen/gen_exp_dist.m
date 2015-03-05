function x = gen_exp_dist(input, lamda)
% assume input is an array n x 1 of random variables
% lamda is input
% output is an array of X values corresponding to the new uniform
% distribution

% pdf  = lamda * exp(-1*lamda*x)
% cdf = 1-exp(-1*lamda*x)   ==> x = (-1/lamda) * log(1-x)

[r, c] = size(input);
x = zeros(r,1);

x = (-1/lamda) * log(1-input);

hold on;
[N,X] = hist(x,100);
xcor = linspace(min(x), max(x), r);
ycor = lamda * exp(-lamda * xcor);
plot(xcor, ycor, 'r');
bar(X, N/(r/length(X)) / (max(x)-(min(x))), 'b');
hold off;