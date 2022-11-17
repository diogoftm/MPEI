same = 0;

for i=2 : 1000
    f = randi(365, i, 1000);
    for j=1 : 1000
        if unique(f(:,j))<i
            same = same +1;
        end
    end
    prob = same / 1000;
    if prob>0.5
        fprintf("N minimo de pessoas = %d", i);
        break;
    end
    same = 0;
end