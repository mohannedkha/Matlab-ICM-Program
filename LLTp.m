
%==================================================
% LL^T-factorization for +ve Definite Matrix A
%==================================================

function [p,L] = LLTp(A)

    n = length(A);
	p = 1;
    
        if A(1,1) > 0
            L(1,1) = sqrt(A(1,1));
        else
            p = 0;
        end
        
        if p == 1
            k = 1;
            
            while (k < n) && (p == 1)
                
                z = lowsys(L(1:k,1:k),A(1:k,k+1));
                L(k+1,1:k) = z';
                b = A(k+1,k+1) - z'*z;
                
                if b > 0
                    L(k+1,k+1) = sqrt(b);
                else
                    p = 0;
                end
                k = k+1;
            end
            
        end
        
end

%==================================================

