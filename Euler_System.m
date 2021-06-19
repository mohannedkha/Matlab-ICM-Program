%===========================================================
%      Solving the ODE System using Euler method 
%===========================================================

%===========================================================
function [t,z] = Euler_System(ts,z0,h)

N = (ts(2)-ts(1))/h;
t(1) = ts(1);

%Number of variables.
v = 2;
z = zeros(v, N+1);
z(:,1) = z0;

        for i = 1:N
              t(i+1) = t(i) + h;
            z(:,i+1) = z(:,i) + h*f(t(i),z(:,i));
        end
        
end

function dzdt = f(t,z)

x = z(1);
y = z(2);

dzdt = [x - y + 1;
        x + 3*y + exp(-t)];
end   

