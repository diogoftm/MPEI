%a)
T = [0.7 0.2 0.3 ; 0.2 0.3 0.3 ; 0.1 0.5 0.4];

%b)
X0 = [1;0;0];
X1 = T^1*X0;
prob2 = X1(1,1);
prob = prob2*prob2;

%c)
X2= T^2*X0; 
probC = 1 - (X1(3,1) + X2(3,1) - X1(3,1)*0.4);

%d)
m = zeros(3,3);
for i=0 : 30
    m = m + T^i * X0;
end
p = m;
p = p(:,1);

%e)
X0 = [0;0;1];
m = zeros(3,3);
for i=0 : 30
    m = m + T^i * X0;
end
pe = m;
pe = pe(:,1);

%g)
r = [0.1,0.3,0.5];
nd_s = r*p;
nd_c = r*pe;
