f = rand(5, 1000)>0.5;
r = sum(f)~=0;
prob = sum((sum(f)~=0 & sum(f)~=1))/sum(r);
fprintf("%f", prob);