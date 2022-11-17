prob1000 = [];
prob1000000 = [];
n = 10:10:100;
doub = 0;
for j=1 : 10
    f1000 = randi(1000,n(j),1000);
    for i = 1 : 1000
        if length(unique(f1000(:,i)))<n(j)
            doub = doub + 1;
        end
    end
    prob1000(j) = doub/1000;
    doub = 0;
end

for j=1 : 10
    f100000 = randi(100000,n(j),1000);
    for i = 1 : 1000
        if length(unique(f100000(:,i)))<n(j)
            doub = doub + 1;
        end
    end
    prob100000(j) = doub/1000;
    doub = 0;
end

subplot(2,1,1);
plot(n,prob1000)
title('Subplot 1: 1000 alvos')
subplot(2,1,2); 
plot(n,prob100000)
title('Subplot 2: 100000 alvos')