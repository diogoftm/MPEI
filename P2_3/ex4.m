p1=0.002;
p2=0.005;
pa=0.001;

f = rand(20,1000)<(p1+p2+pa);
n_b = randi(20,1, 1000);
p = zeros(1,1000);
for i = 1 : 1000
    p(i)=f(n_b(i),i);
end

prob_a = sum(p==0)/1000;