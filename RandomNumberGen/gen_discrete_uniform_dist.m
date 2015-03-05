function x = gen_discrete_uniform_dist(input,interval,prob)
% assume input is an array n x 1 of random variables
% interval is P(x = interval) = prob
% interval is a set of array and prob is a set of array

[input_r, input_c] = size(input);

x = zeros(input_r,1);
cum_vec = cumsum(prob);     %cum_vec is 1 x n vector
[cum_r, cum_c] = size(cum_vec);

for i=1:input_r
   % will need to use cumsum which contains cumulative sum the elements 
   % of a vector. last value of this vector is 1 
    array_index = 1;

    while(array_index<cum_c)
        if input(i) > cum_vec(array_index)
            array_index = array_index+1;
        else
            break
        end
    end
    x(i,1) = interval(array_index);
end

[N,X] = hist(x);
hold on;
xcor = linspace(min(x), max(x), 100);
ycor = 0.5;
plot(xcor, ycor, 'r+');
ycor1 = 0.3;
plot(xcor, ycor1, 'r+');
ycor2 = 0.2;
plot(xcor, ycor2, 'r+');
bar(X, N/sum(N));
hold off;