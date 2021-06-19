
%===========================================================
%      Solving Rossler System using Runge-Kutta and ODE45
%===========================================================

%===========================================================

%This file will call both the ode and RK4 solutions to comapre them.

% Different H values to see how the rung kutta solution will converge
% against the ode solver.
h= [0.1 0.05 0.01 0.005];


%ODE Function
[t_ode,g] = Rossler_Systemode45();

%Figure state
f = figure('WindowState','maximized');
pause(0.05);

% for loop to plot different h with the ode.
for i= 1:4
    [t,u] = Rossler_SystemRK4(h(i));
    subplot(2,2,i), plot(t_ode,g,t,u,':');
    legend ('Ode45 Solution x','Ode45 Solution y','Ode45 Solution z',['Rung Kutta Solution (x y z) for h = ',num2str(h(i))], 'location', 'northwest');
    xlabel('Time (t)');
    ylabel('Solution x(t) y(t) z(t)');
    title('Ode45 vs Rung Kutaa solution');
end
    
%Main conclusion 

% The difference between the Ode solution and the RK4 stages will vary much
% despite the chaange in the h size, i ve tried to put h as low as 0.000005
% and after a long waiting there was no different between it and the
% selected minimum value for h, this result indicate a fundemental
% difference betwwen the RK4 and the matlab ode45 solver.