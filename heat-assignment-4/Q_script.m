clear all;
clc;
%% Q1
Bi = 10;
tnd = [0.05 0.1 1];
eqn = @(lambda) lambda*tan(lambda)-Bi;
iGuesses = linspace(0.1,10,100);
index=1;
lambda_values(1) = fsolve(eqn,iGuesses(index));
for i = 2:length(iGuesses)
    lambda_value = fsolve(eqn,iGuesses(i));
    if lambda_value-lambda_values(index)>0.1
        index = index+1;
        lambda_values(index) = lambda_value;
    end
end
X = linspace(0,1,100);
% tnd(1)
theta_1 = Q1_function(lambda_values(1),X,tnd(1));
figure(1);
p1 = plot(X,theta_1);
hold on;
theta_3 = Q1_function(lambda_values(1),X,tnd(1)) + Q1_function(lambda_values(2),X,tnd(1)) + Q1_function(lambda_values(3),X,tnd(1));
p2 = plot(X,theta_3);
% now tnd(2)
theta_1_01 = Q1_function(lambda_values(1),X,tnd(2));
p3 = plot(X,theta_1_01);
theta_3_01 = Q1_function(lambda_values(1),X,tnd(2)) + Q1_function(lambda_values(2),X,tnd(2)) + Q1_function(lambda_values(3),X,tnd(2));
p4 = plot(X,theta_3_01);
% now tnd(3)
theta_1_1 = Q1_function(lambda_values(1),X,tnd(3));
p5 = plot(X,theta_1_1);
theta_3_1 = Q1_function(lambda_values(1),X,tnd(3)) + Q1_function(lambda_values(2),X,tnd(3)) + Q1_function(lambda_values(3),X,tnd(3));
p6 = plot(X,theta_3_1);
hold off;
xlabel("x");
ylabel("\theta");
legend([p1 p2 p3 p4 p5 p6],{"N=1,tau=0.05","N=3,tau=0.05","N=1,tau=0.1","N=3,tau=0.1","N=1,tau=1","N=3,tau=1"});
title('Q1-> \Theta vs x for tau=[0.05,0.1,1] and Bi=10');
%% Q1-part3
tnd_new = linspace(0,2,1000);
X_new = 0;
theta_3_tnd = Q1_function(lambda_values(1),X_new,tnd_new) + Q1_function(lambda_values(2),X_new,tnd_new) + Q1_function(lambda_values(3),X_new,tnd_new);
figure(2);
plot(tnd_new,theta_3_tnd);
hold on;
Bi_new = 1;
eqn2 = @(lambda) lambda*tan(lambda)-Bi_new;
iGuesses = linspace(0.1,10,100);
index=1;
lambda_values_2(1) = fsolve(eqn2,iGuesses(index));
for i = 2:length(iGuesses)
    lambda_value = fsolve(eqn2,iGuesses(i));
    if lambda_value-lambda_values(index)>0.1
        index = index+1;
        lambda_values_2(index) = lambda_value;
    end
end
theta_3_tnd_Bi_new = Q1_function(lambda_values_2(1),X_new,tnd_new) + Q1_function(lambda_values_2(2),X_new,tnd_new) + Q1_function(lambda_values_2(3),X_new,tnd_new);
plot(tnd_new,theta_3_tnd_Bi_new);
hold off;
xlabel("t");
ylabel("\theta");
legend("Bi=10","Bi=1");
title('Q3-> \Theta vs tau for x=0');
% THE BIOT CASE THAT DECAYS FASTER IS THE HIGHER BIOT NUMBER
%% Q1-Part4
Bi_new = 0.1;
for i=1:5
    func = @(lambda)(-Bi_new+lambda*tan(lambda));
    lambda=fsolve(func,(i-1)*pi+1);
    lambda3(i)=lambda;
end
tc4 = linspace(0,2,100);
theta_lumped= exp(-0.1.*tc4);
theta1(9,:)= Q1_theta(lambda3,3,0,tc4);

figure(3)
plot(tc4,theta1(9,:),tc4,theta_lumped)
xlabel("t")
ylabel("\theta")
legend("eigen functions","lumped solution")
title('Q4-> \Theta vs t for X=0 and Bi=0.1')
%% Q2 -> PDEPE
L = 1; 
h = 0.01;
x_domain = linspace(0,1,100);
Bi = 10;
t_domain = linspace(0.001,2,401);
m = 0;

sol = pdepe(m,@heatTransient,@heatic,@heatbcond,x_domain,t_domain);

eqn = @(lambda) lambda*tan(lambda)-Bi;
iGuesses = linspace(0.1,20,100);
index=1;
lambda_values(1) = fsolve(eqn,iGuesses(index));
for i = 2:length(iGuesses)
    lambda_value = fsolve(eqn,iGuesses(i));
    if lambda_value-lambda_values(index)>0.1
        index = index+1;
        lambda_values(index) = lambda_value;
    end
end
theta1 = temp_spat_func(0.001,5,lambda_values);
theta2 = temp_spat_func(0.01,5,lambda_values);
theta3 = temp_spat_func(0.1,5,lambda_values);

figure(4);
plot(x_domain,sol);
xlabel("x")
ylabel("\theta")
title("Q2 -> PDE plot");
figure(5);
plot(x_domain,sol(2,:),x_domain,theta1);
title("Question 2A");
xlabel("x")
ylabel("\theta")
legend('pdepe curve','series solution')
figure(6);
plot(x_domain,sol(3,:),x_domain,theta2);
title("Question 2B");
xlabel("x")
ylabel("\theta")
legend('pdepe curve','series solution')
figure(7);
plot(x_domain,sol(21,:),x_domain,theta3);
title("Question 2C");
xlabel("x")
ylabel("\theta")
legend('pdepe curve','series solution')

