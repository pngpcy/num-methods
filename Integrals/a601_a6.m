%% numerical method homework 6
clc;
clear;
% composite trapzoid rule
f = @(x) exp((-x^2)/2);
n = 0; % set to 0 if we want to use tolerance
tol = 0.00001;
%[a1 n itr] = trapezoid(-1,1,f,n,tol);


for i = 1 : 50
   I(i) = trapezoid(-1,1,f,i);
end

diff = I(2:end) - I(1:end-1);
A = find(abs(diff) < tol);
loc = A(2);    

plot(1:length(I), I,'b-',loc, I(loc),'r*');

%% composite simpson 1/3 rule
clc;
clear;
f = @(x) exp((-x^2)/2);
n = 0;
tol = 0.00001;
%[a2 n itr] = simpson13(-1,1,f,n, tol);


j = 1;
for i = 3:2:50
   I(j) = simpson13(-1,1,f,i);
   j = j+1;
end

diff = I(2:end) - I(1:end-1);
A = find(abs(diff) < tol);
loc = A(2);    

plot(1:length(I), I,'b-',loc, I(loc),'r*');

%% composite simpson 3/8 rule
clc;
clear;

f = @(x) exp((-x^2)/2);
n = 0;

tol = 0.00001;

j = 1;
for i = 4:3:50
   I(j) = simpson38(-1,1,f,i);
   j = j+1;
end

diff = I(2:end) - I(1:end-1);
A = find(abs(diff) < tol);
loc = A(2);    

plot(1:length(I), I,'b-',loc, I(loc),'r*');

%% composite midpoint
clc;
clear;
cla;

f = @(x) exp((-x^2)/2);
n = 0;

tol = 0.00001;

j=1;
for i = 2:40
   I(j) = mymidpoint(-1,1,f,i);
   j=j+1;
end

diff = I(2:end) - I(1:end-1);
A = find(abs(diff) < tol);
loc = A(2);    

plot(1:length(I), I,'b-',loc, I(loc),'r*');
