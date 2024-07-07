function [R_ins,R_conv] = crit_rad(thick)

k = 0.15;
L = 5;
h = 12;
Rout = 0.0015 + thick;
Rin = 0.0015;
Area = 2 *pi*L.*Rout;


R_ins = log(Rout./Rin)./(2*pi*k*L) % insulation resistance (conductive)
R_conv = 1./(h*Area) % convective resistance

end