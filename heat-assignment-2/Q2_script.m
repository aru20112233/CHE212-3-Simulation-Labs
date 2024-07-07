clc
clear all
k = 1;
Area = 15;
h=10;
%derivative = - 1000/(-k*Area); % heat applied towards negative x-direction, double negative -> positive

bcfun = @(ya,yb)[ya(2)+h*(10-ya(1));yb(2)+10*(yb(1)-10)];

L = 1;
xmesh = [0:0.001:L];
solinit = bvpinit(xmesh,[0;0]);

sol = bvp4c(@odefun_Q1,bcfun,solinit);

mainsol = sol.y;


plot(xmesh,mainsol(1,:))
title('T vs x for glass')

figure
plot(xmesh,mainsol(2,:)*(-k*Area))
title('Q-dot vs x for glass')

%inferences
% 1) as both end have same boundary condn so we get a symmetric graph
% 2) Why the Q is negative I can't intuitively interpret it through diagram
% and equations??