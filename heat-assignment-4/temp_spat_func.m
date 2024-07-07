function theta_new = temp_spat_func(t,N,lambda)
X = linspace(0,1,100);
theta_new =zeros(100,1);
for j = 1:N
    for i = 1:100
        theta(i,j) = (4*sin(lambda(j))/(2*lambda(j) + sin(2*lambda(j))))*(cos(lambda(j)*X(i)))*(exp(-1*lambda(j)^2*t));
    end
end
for i = 1:100
    for j = 1:N
        theta_new(i,1) = theta_new(i,1) + theta(i,j) ;
    end
end
end