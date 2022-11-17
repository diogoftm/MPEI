N = 6;
H = [0, 0.5, 0.5, 0, 1/3, 0;
    1, 0, 0, 0, 1/3, 0;
    0, 0, 0, 1, 1/3, 0;
    0, 0, 0.5, 0, 0, 1;
    0, 0, 0, 0, 0, 0;
    0, 0.5, 0, 0, 0, 0];

A = 0.85*H+(1-0.85)*ones(N)/N;

epsilon = 0.000001;
x0=ones(N,1)/N;
x = x0;
iter = 0;
while 1
    xold=x;
    x=A*x;
    if max(abs(x-xold))<epsilon 
        break ; 
    end
    iter = iter + 1;
end

x1 = A^39*x0;