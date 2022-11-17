%a)
T = [0.8 0 0 0.3 0; 0.2 0.6 0 0.2 0; 0 0.3 1 0 0; 0 0.1 0 0.4 0; 0 0 0 0.1 1];

%b)
x0 = [1;0;0;0;0];
y = zeros(100);
x = 1:100;
for i = 1 : 100
    v = T^i * x0 ;
    y(i) = v(2,1);
end

stem(x,y);

%c)
x0 = [1;0;0;0;0];
y1 = zeros(100);
x1 = 1:100;
y2 = zeros(100);
for i = 1 : 100
    v = T^i * x0 ;  
    y1(i) = v(3,1);
    y2(i) = v(5,1);
end

nexttile
plot(x,y1)
title('Plot 1')

% Bottom plot
nexttile
plot(x,y2)
title('Plot 2')

%d)
Q = [0.8 0 0.3; 0.2 0.6 0.2; 0 0.1 0.4];

%e)
I = eye(3); %id
F = inv(I-Q); %numero médio de vizitas a esse estado antes da absorção

%f)
n1 = sum(F(:,1));
n2 = sum(F(:,2));
n4 = sum(F(:,3));

%g)
R = [0 0.3 0; 0 0 0.1];

B = R * F;

