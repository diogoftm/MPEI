y = 15;
probPoisson_a = (y^0 * exp(-y)) / factorial(0);
v = 0;
for i=0 : 10
    v = v + poisson(y,i);
end

probPoisson_b = 1-v;

function a = poisson(y,k)
    a = (y^k * exp(-y)) / factorial(k);
end 