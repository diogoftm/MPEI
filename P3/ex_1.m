%a)
X0 = [1 ; 0];
P = [0.7 0.8;0.3 0.2];

prob = P^2*X0;
prob_a = prob(1,1);

%b)
X0 = [0 ; 1];
prob = P^2 * X0;
prob_b = prob(2,1);

%c)
X0 = [1 ; 0];
prob = P^30 * X0;
prob_c = prob(1,1);

%d)
X0 = [0.85 ; 0.15];
v = [];
i = 30;
for f = 1  : i 
    a = P^f * X0;
    v(f) = a(2,1);
end 

stem(1:30, v);

