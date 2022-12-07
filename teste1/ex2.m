L = load('L.mat');
N = 90;
H = L.L;
for i = 1 : 90
    H(:,i) = H(:,i)/sum(H(:,i));
end
H
for i=1 : 90
    if sum(L.L(:,i)) == 0
        H(:,i) = ones(N,1)/N;
    end
end

p = 0.85;
A = p*H+(1-p)*ones(N)/N;
x0 = ones(N,1)/N;

iter=1;
x=x0;
epsilon=1e-4;
while 1
    fprintf(1,'iteração %d\n',iter);
    xold=x;
    x=A*x;
    if max(abs(x-xold))<epsilon 
        break ; 
    end
    iter=iter+1;
end

