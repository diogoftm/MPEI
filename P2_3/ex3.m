p1=0.002;
p2=0.005;
pa=0.01;
n = 20;
X = 0:n;
%a)
pX = prob(n,(p1+p2+pa));
stem(X, pX);

%b)
pB = sum(pX(3 : length(pX)));

%c)
E = sum(pX.*X);
var = sum(pX.*X.^2) - E^2;
dp = sqrt(var);
function p = prob(n,prob)
    f = rand(n,1000);
    p = [];
    for i = 0 : n
        p(i+1) = sum((sum(f<(prob))==i))/1000;
    end
end