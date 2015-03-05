function c = gdq(x,n)
% input
% x is an array of nx1 coordinates 
% n is the degree of derivatives to store
% output
% y is a 3d array
a = length(x);
c = zeros(a,a,n);

% for each value of x value
for i=1:a
    %for each value of y value
    for j=1:a
        % for each derivative degree
        for m=1:n
            c(i,j,m) = cal_c(i,j,m,x,a);
        end        
    end       
end

end

function c = cal_c(i,j,m,x,a)

    if m == 1
        if i ~= j
            num = cal_l(i,x);
            denom = (x(i) - x(j)) * cal_l(j,x);
            c = num / denom;
        else
            p = 0;
            for j=1:a
                if i~=j
                    p = p + cal_c(i,j,m,x,a);
                end
            end
            c = -1 * p;
        end
    else
        if m > 1
            if i == j
                p = 0;
                for j=1:a
                    if i~=j
                        p = p + cal_c(i,j,m,x,a);
                    end
                end
                c = -1 * p;
            else
               c = m * (cal_c(i,j,1,x,a) * cal_c(i,i,m-1,x,a) - ...
                   cal_c(i,j,m-1,x,a) / (x(i)-x(j)));
            end        
        end
    end
end

function l = cal_l(i,x)
    xi = x(i);
    x = x(x~=xi);
    x = x-xi;
    l = prod(x);
end