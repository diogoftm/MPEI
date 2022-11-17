p = 0.5;
k = 2;
n = 3;

prob_2 = nchoosek(n, k) * p^k*(1-p)^(n-k);

prob_1 = prob(0.5, 3, 2, 1000000);

function res = prob(p, n, c, N)
    lancamentos = rand(n, N)>p;
    sucesses = sum(lancamentos)==c;
    res = sum(sucesses)/N;
end