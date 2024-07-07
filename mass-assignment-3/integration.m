function f = integration(Y,x_fit,Y2,Gs,Ls)
f = 1./(Y-(x_fit(1).*(Y-Y2).*(Gs./Ls)./(1+x_fit(2).*((Y-Y2).*(Gs./Ls)))));
end
