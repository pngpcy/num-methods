clear all;
clc;
%% uniform distribution
rng default;
x = rand(100000,1);
uniform_dis = gen_uniform_dist(x,2,5);


%% discrete uniform distribution
rng default;
x = rand(100000,1);
interval = [sqrt(2), sqrt(5), sqrt(7)];
prob = [0.5, 0.3, 0.2];
discrete_uniform_dis = gen_discrete_uniform_dist(x,interval,prob);

%% exponential distribution
rng default;
x = rand(100000,1);
lamda = 2;
exp_dis = gen_exp_dist(x,lamda);

%% triangular distribution
rng default;
x = rand(100000,1);
tri_dis = gen_tri_dis(x,1,2,4);

%% empirical distribution
rng default;
x = rand(100000,1);
emp_con_dis = gen_emp_con_dis(x);

%% normal distribution
rng default;
x = rand(100000,1);
numbers_to_gen = 100000/2;
mean = 1.5;
sd = sqrt(0.4);
method = 2;  % 1 for box muller, 2 for advanced box muller
[normal_dis normal_dis2] = gen_norm_dis(mean, sd, x, numbers_to_gen, method);


%% lognormal distribution
rng default;
x = rand(100000,1);
numbers_to_gen = 100000/2;
mean = 1.5;
sd = sqrt(0.4);
method = 2;  % 1 for box muller, 2 for advanced box muller
[lognormal_dis lognormal_dis2] = gen_lognorm_dis(mean, sd, x, numbers_to_gen, method);

%% poisson distribution

rng default;
x = rand(100000,1);
lamda = 2;
poisson_dis = gen_poisson_dis(x, lamda);

%% general continuous distribution in a finite interval

rng default;
x = rand(10000,1);
generalcon_dis = gen_generalcon_dis(x);