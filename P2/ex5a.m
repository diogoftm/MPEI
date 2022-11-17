f = randi(6, 2, 100);

probA = 0; 
probB = 0; 
probC = 0; 
probD = 0;

fa = sum(f);
fa = sum(fa==9);
probA = fa/100;

countB = 0;
for i = 1 : 100
   if mod(f(2,i),2) == 0
        countB = countB + 1;
   end
end
probB = countB/100;

countC = 0;
for i = 1 : 100
   if f(2,i) == 5 || f(1,i) == 5
        countC = countC + 1;
   end
end
probC = countC/100;

countD = 0;
for i = 1 : 100
   if f(2,i) ~= 1 || f(1,i) ~= 1
        countD = countD + 1;
   end
end
probD = countD/100;

fprintf("A - %f | B - %f |C - %f |D - %f |", probA, probB, probC, probD);
