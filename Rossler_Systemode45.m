%===========================================================
%      Solving Rossler System using ODE45 
%===========================================================

%===========================================================

function [t_ode,g] = Rossler_Systemode45()

t0 = 0;
tf = 25;

uo = [rand() rand() rand()];
tspan = [t0 tf];

[t_ode,g] = ode45(@odefun,tspan,uo);

end

function dudt = odefun(t_ode,g)
x = g(1);
y = g(2);
z = g(3);

dudt = zeros(3);

dudt = [-y-z;x+0.2*y;0.2+z*(x-14)];
end