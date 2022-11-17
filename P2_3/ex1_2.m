p1=0.002;
p2=0.005;
pa=0.01;

%ex.1 
%a)
f8 = rand(8,1000);
probA = sum((sum(f8<(p1+p2+pa))>0))/1000;
%b)
nB = (sum((sum(f8<(pa))>0))/sum((sum(f8<(p1+p2+pa))>0)))*8;

%ex.2
%a)
prob2A = sum((sum(f8<(p1+p2+pa))==0))/1000;
%b)
prob = p1+p2+pa;
prob2A_t = nchoosek(8, 0) * prob^0*(1-prob)^(8);
%c)
x = 2:20;
y = [];

for i=2 : 20
    f = rand(i,1000);
    y(i-1) = sum((sum(f<(p1+p2+pa))==0))/1000;
end

plot(x,y);

%d) R: 6




