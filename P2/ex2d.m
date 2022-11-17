m = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000 , 100000];
probs = [];
doub = 0;
for j=1 : 9
    f = randi(m(j),100,1000);
    for i = 1 : 1000
        if length(unique(f(:,i)))<100
            doub = doub + 1;
        end
    end
    probs(j) = doub/1000;
    doub = 0;
end

plot(m, probs)
title("Plot 1: 100 dardos")