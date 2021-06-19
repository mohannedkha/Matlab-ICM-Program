%===========================================================
% Comparison between Euler method and the analytical Solution 
%===========================================================

%===========================================================

% Initial Conditions

ts =[0 10];
z0 = [0 1];
h = [0.005 0.01 0.05 0.1];

% To find the exact solution
syms x(t) y(t)
eqn1 = diff(x,t) == x-y+1;
eqn2 = diff(y,t) == x+3*y+exp(-t);
inits = [x(0) == 0, y(0) == 1];
[x_exact,y_exact] = dsolve(eqn1,eqn2,inits);

% Plotting
for i = 1:4
    [t,z] = Euler_System(ts,z0,h(i));
    figure(1);
    hold on
    plot(t,eval(vectorize(x_exact)),t,z(1,:));% eval will create data points using t on the exact solution as a vector size.
    xlabel('t');
    ylabel('x(t)');
    title('x vs t in ');
    legend('Exact Solution','Euler Solution h =0.005','Euler Solution h =0.01','Euler Solution h =0.05','Euler Solution h =0.1','location','NorthWest')
    grid on
    hold off
    figure(2);
    hold on
    plot(t,z(2,:));
    plot(t,eval(vectorize(y_exact)),t,z(2,:));% eval will create data points using t on the exact solution as a vector size.
    xlabel('t');
    ylabel('y(t)');
    title('y vs t');
    hold off
    legend('Exact Solution','Euler Solution h =0.005','Euler Solution h =0.01','Euler Solution h =0.05','Euler Solution h =0.1','location','NorthWest')
    grid on
end
