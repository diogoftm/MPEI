p = load("prob_pt.txt");
keys = keyGen(6,20,1e5,'a':'z');

t = cell(4,3);
for i=1 : 4
    t{i,1} = zeros(1,5e5);
    t{i,2} = zeros(1,1e6);
    t{i,3} = zeros(1,2e6);
end

c = [[0,0,0];[0,0,0];[0,0,0];[0,0,0]]; %count the number colisions per number of samples

%tamanho 5e5
for i=1 : 1e5
    k = convertStringsToChars(keys{1,i});
    h1_ = string2hash(k, 'djb2');
    h2_ = string2hash(k, 'sdbm');
    h1 = [mod(h1_, 5e5)+1, mod(h1_,1e6)+1, mod(h1_,2e6)+1];
    h2 = [mod(h2_,5e5)+1, mod(h2_,1e6)+1, mod(h2_,2e6)+1];
    h3 = [hashstring(k, 5e5-1)+1, hashstring(k, 1e6-1)+1, hashstring(k, 2e6-1)+1];
    h4 = [mod(DJB31MA(k,1),5e5)+1, mod(DJB31MA(k,1),1e6)+1, mod(DJB31MA(k,1),2e6)+1];
    
    for i=1 : 3
        if t{1,i}(1,h1(1,i))==0
            t{1,i}(1,h1(1,i)) = 1;
        else
            c(:,i) = c(:,i) + [1;0;0;0]; %add one to the hit counter
        end
    
        if t{2,i}(1,h2(1,i))==0
            t{2,i}(1,h2(1,i)) = 1;
        else
            c(:,i) = c(:,i) + [0;1;0;0]; %add one to the hit counter
        end
    
        if t{3,i}(1,h3(1,i))==0
            t{3,i}(1,h3(1,i)) = 1;
        else
            c(:,i) = c(:,i) + [0;0;1;0]; %add one to the hit counter
        end
    
        if t{4,i}(1,h4(1,i))==0
            t{4,i}(1,h4(1,i)) = 1;
        else
            c(:,i) = c(:,i) + [0;0;0;1]; %add one to the hit counter
        end
    end
end

tiledlayout(2,1);
nexttile;
histogram(find(t{3,1}), 100);
title('hashstring')

nexttile;
histogram(find(t{2,1}), 100);
title('sdbm')

function c = keyGen(min, max, N, chars, probs)
    if nargin == 4
        probs = ones(length(chars),1)/length(chars);
        probs = probs.';
    end
    siz = randi([min, max]);
    c = cell(1,N);
    m = containers.Map;
    for n=1 : N
        while 1
            str = "";
            for s=1: siz
                pos = sum(rand >= cumsum([0 probs]));
                result = chars(pos);
                str = str + result;
            end
            if isKey(m,str)
                continue
            end
            c{1,n} = str;
            m(str) = 0;
            break
        end
    end
end

function h= DJB31MA( chave, seed)
% implementação da hash function DJB31MA com base no algoritmo obtido
% no resumo 2014(PJF) que está em C
%
%  chave    array de caracteres com a chave
%  seed     semente que permite obter vários hash codes para a mesma chave
%
%  h        hashcode devolvido
len= length(chave);
chave= double(chave);
h= seed;
for i=1:len
    h = mod(31 * h + chave(i), 2^32 -1) ;
end
end


function hash=string2hash(str,type)
str=double(str);
if(nargin<2), type='djb2'; end
switch(type)
    case 'djb2'
        hash = 5381*ones(size(str,1),1); 
        for i=1:size(str,2), 
            hash = mod(hash * 33 + str(:,i), 2^32-1);
        end
    case 'sdbm'
        hash = zeros(size(str,1),1);
        for i=1:size(str,2), 
            hash = mod(hash * 65599 + str(:,i), 2^32-1);
        end
    otherwise
        error('string_hash:inputs','unknown type');
end
end