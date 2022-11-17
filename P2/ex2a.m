f = randi(100, 20, 1000);
uni = 0;
for i = 1 : 1000
    if length(unique(f(:,i)))==20
        uni = uni + 1;
    end
end

prob = uni/1000;
fprintf("%f", prob);