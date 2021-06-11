function [p,L,U] = pluf1(A)
n = length(A);
p = 1:n;
for k = 1:n-1
    [p,A] = pivot(p,A,k);
    for i = k+1:n
        A(i,k) = A(i,k)/A(k,k);
        for j =k+1:n
            A(i,j) = A(i,j)-A(i,k)*A(k,j);
        end
    end
end
U = triu(A);
L = tril(A)-diag(diag(A))+eye(n);
end

function [p,A] = pivot(p,A,k)
n = length(p);
r = k;
big = abs(A(k,k));
for i = k+1:n
    if abs(A(i,k))>big
        r = i;
        big = abs(A(i,k));
    end
end
for j = 1:n
    [A(k,j),A(r,j)] = swap(A(k,j),A(r,j));
end
[p(k),p(r)] = swap(p(k) , p(r));
end

function [x,y] = swap(x,y)
        z =x;
        x = y;
        y = z;
end
 