x = [0 1 2]
p = [2 3 5];
tic
mat_y = polyval(p,x);

toc
tic
%y1 = mypolyval1(p,x);
toc
tic
%y2 = mypolyval2(p,x);
toc
tic
y3 = mypolyval3(p,x);
toc

%%
clc;
clear;
cla;
x = [0 1 2];
y = [2 3 5];
co = mypolyfit(x,y);
xcor = linspace(min(x), max(x));
ycor = mypolyval3(co,xcor);
plot(xcor,ycor,'b', x,y,'r*')

%%
clc;
clear;
cla;
x = [0 1 2];
y = [2 3 5];
xcor = linspace(min(x), max(x));
[Nvalues ycor] = newton_ddp(x, y, xcor);
plot(xcor,ycor,'b', x,y,'r*')

%% 
clc;
clear;
cla;
x = [0 1 2];
y = [2 3 5];
xcor = linspace(min(x), max(x));
ycor = lagrange_interp(x, y, xcor);
plot(xcor,ycor,'b', x,y,'r*')

%%
clc;
clear;
cla;
x = [0 1 2 3];
y = [3 5 4 1];
xcor = linspace(min(x), max(x));
ycor = linear_spline(x, y, xcor);
plot(xcor,ycor,'b', x,y,'r*')

%% 
clc;
clear;
cla;
x = [0 1 2 3];
y = [3 5 4 1];
xcor = linspace(min(x), max(x));
ycor = quad_spline(x, y, xcor);
plot(xcor,ycor,'b', x,y,'r*')

%%
clc;
clear;
cla;
x = [0 1 2 3];
y = [3 5 4 1];
xcor = linspace(min(x), max(x));
ycor = cubic_spline(x, y, xcor);
plot(xcor,ycor,'b', x,y,'r*')
