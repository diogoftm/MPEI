%a)
T = [0.16 0 0 0.36 ; 0.36 0 0 0.24 ; 0.24 0 0 0.24 ; 0.24 1 1 0.16];

%b)
X0 = [1 ; 0 ; 0 ; 0];
prob_5 = T^5 * X0;
prob_10 = T^10 * X0;
prob_100 = T^100 * X0;
prob_200 = T^200 * X0;

%c)probabilidades limite?
XI = T^1000;
