fo = randn(1,1000);
f = abs(fo.*2+14);
probA = (sum(f>12)-sum(f>16))/1000;
probB = (sum(f>10)-sum(f>18))/1000;
probC = sum(f>10)/1000;

n = normcdf([0:20], 14, 2);
probA_c = n(16)-n(12);