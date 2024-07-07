function f = Q1_function(lambda,X,t_nonDimensionalize)
    f = (4.*sin(lambda))./(2*lambda + sin(2*lambda)).*cos(lambda.*X).*exp(-lambda.^2.*t_nonDimensionalize);
end