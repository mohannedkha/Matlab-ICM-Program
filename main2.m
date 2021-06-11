%  This File will be used as a main file to call the Ode45 function, to calculate the solution of the differential equation and plot it
%  against the exact solution. To show the main value of the Ode45,
%  different final x will be used to find different values of y. the goal
%  is to test the ode45 auto step size.

% Initial Conditions
xinit = 0;
yinit = 1;

% Different final values for xfinal were used to find different y,
xfinal = [0.3,0.5,1,10];

% To maximize the figures automaticle
f = figure('WindowState','maximized');
pause(0.05);

for i= 1:4
    [x_vector,y_vector] = using_ode45_solver(xinit,yinit,xfinal(i));
    exact_solution = sqrt(x_vector.^2+1);
    subplot(2,2,i), plot(x_vector,exact_solution,'bo-',x_vector,y_vector,'g+:');
    legend ('Aalytical','ode45','location','Northwest');
    title(['Analytical Solution vs Ode45 for xfinal = ',num2str(xfinal(i))]);
    xlabel('x');
    ylabel('y(x)');
end

sgt = sgtitle('Solution of dy/dx = x/y in Analytical and Ode45','Color','Black');
sgt.FontSize = 20;

% we can conclude here that Ode45 will always find the best step size to
% get the most accurate answer.
