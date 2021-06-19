function [x,d] = odsys(A,b)
[m,n] = size(A);
[Q,R] = qrf(A);
Q1 = Q(:,1:n);
Q2 = Q(:,n+1:m);
Rn = R(1:n,:);
x = upsys(Rn,Q1'*b);
d = norm(Q2.*b);