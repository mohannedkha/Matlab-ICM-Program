function x = linsys1(A,b)

n = length(b);
A = luf1(A);
for i = 1:n
    y(i) = b(i);
    for j = 1:i-1
        y(i) = y(i)-A(i,j)*y(j);
    end
end
for i = n:-1:1
    x(i) = y(i);
    for j = i+1:n
        x(i) = x(i)-A(i,j)*x(j);
    end
end
    x(i) = x(i) / A(i,i);
    x = x';