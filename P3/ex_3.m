%a)
v = rand(20,20);
P = v./sum(v);

%b)
X0 = zeros(20,1);
X0(1,1) = 1;
p = P^2 * X0;
p_b = P^5 * X0;
p_c = P^10 * X0;
p_d = P^100 * X0;
prob_a = p(20,1) * 100;
prob_b = p_b(20,1) * 100;
prob_c = p_c(20,1) * 100;
prob_d = p_d(20,1) * 100;
