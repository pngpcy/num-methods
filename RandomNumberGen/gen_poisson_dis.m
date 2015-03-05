function x = gen_poisson_dis(input, lamda)


[r, c] = size(input);

for i=1:r
   k = 0;
   CDF = exp(-lamda);
   
   while(true)
       if input(i) < CDF
           x(i) = k;
           break
       else
           k = k+1;
           CDF = CDF + (exp(-lamda) * lamda^k) / factorial(k);
       end
   end
end

hold on;
[N, X] = hist(x,30);
bar(X, N/(sum(N)), 'b');
for i=min(x):1:max(x)
    xcor(i+1) = i;
    ycor(i+1) = (exp(-lamda) * lamda^i) / factorial(i);
end
plot(xcor, ycor, 'r');
