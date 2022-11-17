f = rand(2, 1000)>0.5;
suc = sum(f)~=0;
sim = sum(sum(f)==2)/sum(suc);

fprintf("%f", sim);