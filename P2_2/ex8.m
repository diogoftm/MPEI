prob = poisson(0.02*100,1) + poisson(0.02*100,0);

function a = poisson(y,k)
    a = (y^k * exp(-y)) / factorial(k);
end 