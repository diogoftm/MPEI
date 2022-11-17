%a) b)
f1 = rand(20, 10000)<0.01;
f2 = rand(30, 10000)<0.05;
f3 = rand(50, 10000)<0.001;

sf1 = sum(sum(f1));
sf2 = sum(sum(f2));
sf3 = sum(sum(f3));

probA = sf1/(sf1+sf2+sf3);
probB = sf2/(sf1+sf2+sf3);
probC = sf3/(sf1+sf2+sf3);

fprintf("Andre: %f, Bruno: %f, Carlos: %f", probA, probB, probC);





