function x = udsys(A,b,h)
[m,n] = size(A);
[Q,R] = qrf(A');
Q1 = Q(:,1:m);
Q2 = Q(:,m+1:n);
Rm = R(1:m,:);
w = lowsys(Rm',b);
x = Q1*w+Q2*h;