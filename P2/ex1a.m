f = rand(2, 1000)>0.5;
suc = sum(f)~=0;
sim = sum(suc)/1000;

fprintf("%f", sim);