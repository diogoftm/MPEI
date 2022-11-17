f = rand(4,1000)<0.5;
p0 = sum(sum(f)==0)/1000;
p1 = sum(sum(f)==1)/1000;
p2 = sum(sum(f)==2)/1000;
p3 = sum(sum(f)==3)/1000;
p4 = sum(sum(f)==4)/1000;
p = [p0,p1,p2,p3,p4];
x = 0:4;

%valor esperado (E(x))
ve = sum(p.*x);

%variancia 
v = sum(p.*x.^2) - ve^2;
va = var(sum(f));

%devio padrão - dp
dp = sqrt(v);

%f) 
pi = p2+p3+p4;
pii = p0+p1;
piii = p1 +p2+p3;
