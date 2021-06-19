function x = wdsys(A,b)
[Q,r] = qrf(A);

x = upsys(r,Q'*b);