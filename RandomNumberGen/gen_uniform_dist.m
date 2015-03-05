function x = gen_uniform_dist(input, a, b)
% assume input is an array n x 1 of random variables
% a and b is a left and right interval
% output is an array of X values corresponding to the new uniform
% distribution

% pdf  = 1/(b-a)
% cdf = (x-a) / (b-a)   ==> x = R(b-a) + a

[r, c] = size(input);
x = zeros(r,1);

x = input.*(b-a) + a;

[N,X] = hist(x);
hold on;
xcor = linspace(min(x), max(x), 100);
ycor = 1/(b-a);
plot(xcor, ycor, 'r+');
bar(X, N/(r/10) / (max(x)-(min(x))));
hold off;