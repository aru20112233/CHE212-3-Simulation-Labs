clc
clear all

T0 = 100;
Tl = 50;
k = 1;
Area = 15;
%derivative = - 1000/(-k*Area); % heat applied towards negative x-direction, double negative -> positive

bcfun = @(ya,yb)[ya(1)-T0;yb(1)-Tl];

L = 1;
xmesh = [0:0.001:L];
solinit = bvpinit(xmesh,[0;0]);

sol = bvp4c(@odefun_Q1,bcfun,solinit);

mainsol = sol.y;


plot(xmesh,mainsol(1,:))
title('T vs x for glass')
ylabel('Temperature');
xlabel('x')

figure
plot(xmesh,mainsol(2,:).*(-k*Area))
title('Q-dot vs x for glass')

% Inferences
% 1) The curve is parabolic type with eqn as T = -egenx^2/2k + 450x + 100
% 2) the maxima occurs at x = 0.45 approx which shows that there is a point
% in between having the approx temp of 200C showing that heat is
% transferring from both sides heater and temp difference