function [x_vector,y_vector] = using_ode45_solver(xinit,yinit,xfinal)
options = odeset('RelTol',1e-6,'AbsTol',[1e-6]);
t0 = xinit;
tf = xfinal;
y0=yinit;

[x,y] = ode45(@rhs, [t0 tf], y0 ,options);

x_vector = x;
y_vector = y;

end

function dydx = rhs(x,y)
dydx = x/y;
end