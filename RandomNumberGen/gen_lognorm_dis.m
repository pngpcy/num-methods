function [results1 results2]= gen_lognorm_dis(mean, sd, input, numbers_to_gen, method)
% assume input is an array n x 1 of random variables
% output is an array of X values corresponding to the new uniform
% distribution
if mod(numbers_to_gen,2) > 0
    numbers_to_gen = numbers_to_gen + 1;
end

[r, c] = size(input);
%x = zeros(numbers_to_gen,1);
%y = zeros(numbers_to_gen,1);

j = 1;
if method == 2
    
    for i=1:2:r
        V1 = 2*input(i) - 1;
        V2 = 2*input(i+1) - 1;
        S = V1^2 + V2^2;
        if S < 1
            x(j) = V1 * sqrt((-2 * log(S)) / S);
            y(j) = V2 * sqrt((-2 * log(S)) / S);
            j = j+1;
        end
        if j > numbers_to_gen
            break;
        end
    end
else
    for i=1:2:r
        x(j) = (sqrt(-2*log(input(i)))) * cos(2*pi*input(i+1));
        y(j) = (sqrt(-2*log(input(i)))) * sin(2*pi*input(i+1));
        j = j+1;
        if j > numbers_to_gen
            break;
        end
    end
end


results1 = exp(mean + sd.*(x));
results2 = exp(mean + sd.*(y));

hold on;
[N, X] = hist(results1,30);
bar(X, N/(sum(N)/length(X)) / (max(results1)-min(results1)), 'b');
xcor = linspace(min(results1), max(results1), 100);
ycor = (1./(xcor*sd*sqrt(2*pi)) .* exp(-1 * ((log(xcor)) - mean).^2 / (2*sd^2)));
plot(xcor, ycor, 'r');
