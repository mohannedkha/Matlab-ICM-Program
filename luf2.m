function [L,U] = luf2(A)
n = length(A);
L = eye(n);
U(1,1)= A(1,1);
for k = 1:n-1
    U(L:k,k+1)= lowsys(L(1:k,1:k),A(1:k,k+1));
    z  = lowsys(U(1:k,1:k)',A(k+1,1:k));
    L(k+1,1:k) = z';
    U(k+1,k+1) = A(k+1,k+1) - z'*U(1:k,k+1);
end