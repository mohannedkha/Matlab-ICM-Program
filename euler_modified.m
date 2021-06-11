function [x,y_euler_modified] = euler_modified(xinit,yinit,xfinal,n)
% This function will input the x0, y0 xfainal and the number of iterations
% to calculate the x and y vector as output.

%Input
h = (xfinal-xinit)/n;

%Initiation
x = zeros(1,n+1);
y = zeros(1,n+1);

%Initioal Conditions
x(1) = xinit;
y(1) = yinit;

for i = 1:n
    y(i+1) = y(i)+h*x(i)/y(i); % use Euler Forward to calculate the first step
    x(i+1) = x(i)+h;
    y(i+1) = y(i)+0.5*h*((x(i+1)/y(i+1))+((x(i)/y(i))));
end

% Output
x = x';
y_euler_modified = y';
end