function theta= Q1_theta(lambda,n,x, t)
theta=zeros(1,100);
for i=1:n
    theta= theta+ 4*sin(lambda(i)).*cos(lambda(i).*x).*exp(-lambda(i)*lambda(i)*t)./(2*lambda(i)+ sin(2*lambda(i)));
end
end