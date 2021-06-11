function x = linsys(A,b)

[L,U] = luf(A);
y = lowsys(L,b);
x = upsys(U,y);