function c = keyGen(min, max, N, chars, probs)
    if nargin == 4
        probs = ones(length(chars),1)/length(chars);
        probs = probs.';
    end
    siz = randi([min, max]);
    c = cell(1,N);
    m = containers.Map;
    for n=1 : N
        str = "";
        for s=1: siz
            pos = sum(rand >= cumsum([0 probs]));
            result = chars(pos);
            str = str + result;
        end
        if isKey(m,str)
            n = n-1;
            continue
        end
        c{1,n} = str;
        m(str) = 0;
    end
end