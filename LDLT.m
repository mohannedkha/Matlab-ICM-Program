function [L,d] = LDLT(A)
n = length(A);
L = eye(n);
d(1) = A(1,1);
for k = 1:n-1
    z = lowsys(L(1:k,1:k),A(1:k,k+1));
    for i = 1:k
        L(k+1,i) = z(i)/d(i);
    end
    d(k+1)= A(k+1,k+1)-L(k+1,1:k)*z;
end