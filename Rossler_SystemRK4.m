%===========================================================
%      Solving Rossler System using Runge-Kutta Method
%===========================================================

%===========================================================

function [t,u] = Rossler_SystemRK4(h)

t0 = 0;
tf = 25;
x_init = rand();
y_init = rand();
z_init = rand();

N = (tf-t0)/h;

m = 3;

t = (0:N)*h;

u = zeros(m,N+1);

u(:,1) = [x_init;y_init;z_init];

for i = 1:N
    k1=h*f(t,u(:,i));
    k2=h*f(t+0.5*h,u(:,i)+0.5*k1);
    k3=h*f(t+0.5*h,u(:,i)+0.5*k2);
    k4=h*f(t+h,u(:,i)+k3);
    u(:,i+1) =u(:,i)+(1/6)*(k1+k2+k3+k4);
end
end

function dudt = f(t,u)
x = u(1);
y = u(2);
z = u(3);

dudt = zeros(3);

dudt = [-y-z;x+0.2*y;0.2+z*(x-14)];
end