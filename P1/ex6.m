p = 0.3;
k = 3;
n = 5;
prob_a_an = nchoosek(n, k) * p^k*(1-p)^(n-k);
prob_a_sim = prob_a(0.3, 5, 3,10000);

prob_b_an = nchoosek(5, 2) * 0.3^2*(1-0.3)^(5-2) + nchoosek(5, 1) * 0.3^1*(1-0.3)^(5-1) + nchoosek(5, 0) * 0.3^0*(1-0.3)^(5-0);
prob_b_sim = prob_b(0.3, 5, 2,10000);

p = 0.3;
k = 3;
n = 5;
prob_c_an = nchoosek(n, k) * p^k*(1-p)^(n-k);
prob_c_sim = prob_b(0.3, 5, 3,10000);

p = [];
for i=0:1:5
    p = [p,prob_a(0.3, 5, i, 10000)];
end
stem(linspace(0, 5, 6), p);

function res = prob_a(p, n, c, N)
    lancamentos = rand(n, N)<p;
    sucesses = sum(lancamentos)==c;
    res = sum(sucesses)/N;
end

function res = prob_b(p, n, c, N)
    lancamentos = rand(n, N)<p;
    sucesses = sum(lancamentos)<=c;
    res = sum(sucesses)/N;
end