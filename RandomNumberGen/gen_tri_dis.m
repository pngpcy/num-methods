function x = gen_tri_dis(input,a,c,b)
% assume input is an array n x 1 of random variables
% output is an array of X values corresponding to the new uniform
% distribution. c is between a and b

[r, col] = size(input);
x = zeros(r,1);

% for i=1:r
%     if input(i) < 1/3
%         x(i) = 1+sqrt(3*input(i));
%     else
%         x(i) = 4 - sqrt(6*(1-input(i)));
%     end
% end

limit = (c-a)^2 / ( (b-a) * (c-a) );

for i=1:r
   if input(i) <  limit
       x(i) = a + sqrt(input(i) * (b-a) * (c-a));
   else
       x(i) = b - sqrt((1-input(i)) * (b-a) * (b-c));
   end
end


hold on;
[N,X] = hist(x,100);
xcor = linspace(min(x), 2, r);
ycor = 2/3*(xcor-1);
plot(xcor, ycor, 'r');
xcor1 = linspace(2, max(x), r);
ycor1 = -1/3*(xcor1-4);
plot(xcor1, ycor1, 'r');
bar(X, N/(r/length(X)) / (max(x)-(min(x))), 'b');
hold off;