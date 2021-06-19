function u = house(x)
m = length(x);
al = norm(x);

if x(1)>0
    al = -al;
end
u(1) = sqrt(0.5*(1-x(1)/al));
om = -al*u(1);
for i = 2:m
    u(i) = x(i)/(2*om);
end
u = u';
