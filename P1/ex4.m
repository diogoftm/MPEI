f = 0;
X = linspace(0,20, 21)';
a = [];
while f <= 20
    a = [a, prob(0.5, 20, f,10000)];
    f = f + 1;
end

stem(X, a);

function res = prob(p, n, c, N)
    lancamentos = rand(n, N)>p;
    sucesses = sum(lancamentos)==c;
    res = sum(sucesses)/N;
end
