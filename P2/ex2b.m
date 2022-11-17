f = randi(100, 20, 1000);
doub = 0;
for i = 1 : 1000
    if length(unique(f(:,i)))<20
        doub = doub + 1;
    end
end

prob = doub/1000;
fprintf("%f", prob);