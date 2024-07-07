thickness = 2:1:100;
thickness = 10^-3.*thickness;
rin = 1.5/1000;
[Rm,Rc] = crit_rad(thickness);
plot(thickness,Rm);
hold on;
plot(thickness,Rc);
legend('resistance of material','convective resistance');
ylabel('Resistance');
xlabel('Thickness')
hold off;
figure;
plot(thickness+rin,Rc+Rm);
title('RESISTANCE TOTAL');
ylabel('Resistance');
xlabel('Outer radius')
% inferences
% 1) as convective resistance is inversely to r2 so as r2 increases the
% convective resistance decreases and in a rect hyperbola fashion
% 2) as material resistance is directly proportional to r2 so as r2 increases the
% material resistance increases and in a logarithmic fashion
% that's why initially conv resistance decrease dominates until it reaches
% a minima and then the material resistance strats to dominate hence the
% total resistance gets to a min val and then increases
% 3) the min resistance occurs at 11mm thickness which means at 12.5 mm of
% outer radius