%  This File will be used as a main file to call the Three functions and use
%  them to calculate the solution of the differential equation, the outputs
%  of this code is a graph containing a 6 plots each one of them
%  representing a step size, also, a table result for each step size and the error for each method. 

% Initial Conditions
xinit = 0;
yinit = 1;
xfinal = 10;

% Six step sizes to show the different between each method.
n = [5,10,20,30,50,100];

% To maximize the figures automaticly
f = figure('WindowState','maximized');
pause(0.05);


% This for loop will plot each step size on a different subplot.
for i= 1:6
    h=(xfinal-xinit)/n(i);
    [x,y_euler_forward] = euler_forward(xinit,yinit,xfinal,n(i));
    [x,y_euler_modified] = euler_modified(xinit,yinit,xfinal,n(i));
    [x,y_euler_backward] = euler_backward(xinit,yinit,xfinal,n(i));
    exact_solution = sqrt(x.^2+1);
    Results_table = table(x,y_euler_forward,y_euler_backward,y_euler_modified,exact_solution) % to create a result table for each run.
    subplot(3,2,i), plot(x,exact_solution,'-.k', x,y_euler_forward,'r',x,y_euler_modified,'g',x,y_euler_backward,'b');
    legend ('Exact Solution','Euler Forward','Euler Modified','Euler Backward','Location','northwest','NumColumns',1);
    xlabel('x');
    ylabel('y(x)');
    title(['Numerical Solution vs Exact in ',num2str(n(i)),' iterations']);
    
    %Error Calculations
    euler_forward_Error = (exact_solution(end)-y_euler_forward(end))/exact_solution(end)*100;
    euler_modified_Error = (exact_solution(end)-y_euler_modified(end))/exact_solution(end)*100;
    euler_backward_Error = (exact_solution(end)-y_euler_backward(end))/exact_solution(end)*100;
    Error_Table= table(h,euler_forward_Error,euler_modified_Error,euler_backward_Error) % to create an error table for each run.
    end
sgt = sgtitle('Solution of dy/dx = x/y in different methods','Color','Black');
sgt.FontSize = 20;


