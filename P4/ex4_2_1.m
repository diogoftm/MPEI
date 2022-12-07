bf = bf_init(8000);

words1 = keyGen(6,20,1000,'a':'j');
words2 = keyGen(6,20,10000,'k':'z');

for i=1 : 1000
    w = convertStringsToChars(words1{1,i});
    bf = bf_add(bf, w, 3);
end

check = 0; %falsos positivos
for i=1 : 10000
    w = convertStringsToChars(words2{1,i});
    if bf_check(bf, w, 3)
        check = check + 1;
    end
end

%ex 4
p = (1 - exp(-3*1000/8000))^3 * 100; %prob teorica de falsos positivos
p_sim = check / 10000 *100; %prob simulada de falsos positivos

%ex 5
prob_fp = zeros(1,7);
prob_fp_e = zeros(1,7);
for j=4 : 10

    bf = bf_init(8000);
    
    words1 = keyGen(6,20,1000,'a':'j');
    words2 = keyGen(6,20,10000,'k':'z');
    
    for i=1 : 1000
        w = convertStringsToChars(words1{1,i});
        bf = bf_add(bf, w, j);
    end
    
    check = 0; %falsos positivos
    for i=1 : 10000
        w = convertStringsToChars(words2{1,i});
        if bf_check(bf, w, j)
            check = check + 1;
        end
    end
    prob_fp(1,j-3) = check/10000 * 100;
    prob_fp_e(1,j-3) = (1 - exp(-j*1000/8000))^j * 100;
end

tiledlayout(2,1);
nexttile;
plot(4:10, prob_fp);
title('% de falsos positivos (simulacao)')
nexttile;
plot(4:10, prob_fp_e);
title('% de falsos positivos (esperada)')
