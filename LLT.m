function L= LLT(A)

n = length(A);

L(1,1) = sqrt(A(1,1));

for k = 1:n-1
    
    z = lowsys(L(1:k,1:k),A(1:k,k+1));
    
    L(k+1,1:k) = z';
    
    L(k+1,k+1) = sqrt(A(k+1,k+1)-L(k+1,1:k)*z);
    
end
