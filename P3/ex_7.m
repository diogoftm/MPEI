N=6;
H = [0 0 0 0 1 0; 1 0 0 0 1 0; 0 1 0 1 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0];
c = sum(H);
b = repmat(c,N,1);
for i=1 : 6
    for h=1 : 6
        if b(i,h)==0
            b(i,h)=1;
        end
    end
end
H = H./b;

%a
r = [1/6;1/6;1/6;1/6;1/6;1/6];
for i=1 :9
    r = H * r;
end

%c
H = [0 0 0 0 1 1/6; 1 0 0 0 1 1/6; 0 1 0 1 0 1/6; 0 0 1 0 0 1/6; 0 1 0 0 0 1/6; 0 0 0 0 1 1/6];
c = sum(H);
b = repmat(c,N,1);
H = H./b;
r2 = [1/6;1/6;1/6;1/6;1/6;1/6];
for i=1 : 9
    r2 = H * r2;
end

%%%%%

%e)
p = 0.80;
A = p*H+(1-p)*ones(N)/N;
x0=ones(N,1)/N;
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
states = ['A':'F'];
[xs idx] = sort(x, 'descend');
for p=1 : N
    fprintf(1,'Page-rank -> %.3f: %s\n', x(idx(p)),states(idx(p)))
end


