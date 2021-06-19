function [Q,R] = qrf(A)
[m,n] = size(A);
R = A;
Q = eye(m);
for k =1:n
    u = house(R(k:m,k));
    R(k:m,k:n) = ha(u,R(k:m,k:n));
    Q(:,k:m) = ah(u,Q(:,k:m));
end

