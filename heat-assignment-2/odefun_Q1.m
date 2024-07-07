function dydx = odefun_Q1(x,y)
egen = 1000;
K = 1;

eq(1) = y(2);
eq(2) = -egen/K;

dydx = [eq(1); eq(2)];

end

