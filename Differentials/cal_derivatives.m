function L_array = cal_derivatives(co,y)

[r c] = size(y);
if r < c
    y = y';
end

length_y = length(y);
[len_l len_j len_m] = size(co);
L_array = zeros(len_l, len_m);

for i=1:len_m
    %coefficients = co(:,:,i)
    L_array(:,i) = co(:,:,i)*y;
end