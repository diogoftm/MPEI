prob = 0.001;
%distribuição binomial
probBin = nchoosek(8000, 7) * prob^7*(1-prob)^(8000-7);

%Poisson
y = prob * 8000;
probPoisson = (y^7 * exp(-y)) / factorial(7);