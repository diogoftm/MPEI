f = rand(5,1000)<0.3;
sf = sum(f);
n = 1000;
%função massa probabilidade
fmp = [sum(sf==0)/n sum(sf==1)/n sum(sf==2)/n sum(sf==3)/n sum(sf==4)/n sum(sf==5)/n];

%distribuição acumulada de probs
dap = cumsum(fmp);
stairs(0:5,dap)

%iii 
piii = dap(3);