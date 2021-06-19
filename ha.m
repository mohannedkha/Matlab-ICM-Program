function A = ha(u,A)

v = A'*u;
A = A - 2*u*v';