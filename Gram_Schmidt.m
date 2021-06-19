function [Q,R] = Gram_Schmidt(A)

[m,n] = size(A);
% Q = zeros(m,n); R = zeros(n,n);

for j = 1:n
    Q(:,j) = A(:,j);
    for i = 1:j-1
        R(i,j) = Q(:,i)'*A(:,j); 
        Q(:,j) = Q(:,j)-R(i,j)*Q(:,i);
    end
    R(j,j) = norm(Q(:,j),2);
    if R(j,j) == 0
        break;
    end
    Q(:,j) = Q(:,j)/R(j,j);
end