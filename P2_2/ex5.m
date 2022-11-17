pf = 0.2;
fm2 = sum(rand(2, 1000)<pf);
fm4 = sum(rand(4, 1000)<pf);
p2 = sum(fm2==2)/1000;
p4 = sum(fm4>=3)/1000;

q = p4/p2;