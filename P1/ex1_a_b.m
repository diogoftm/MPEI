N = 1e5;
p = 0.5;
k = 2;
n = 3;

lancamentos = rand(n, N)>p;
sucesses = sum(lancamentos)==k;
sim = sum(sucesses)/N;

fprintf("Resultado = %f", sim);

