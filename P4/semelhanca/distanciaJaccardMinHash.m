function J = distanciaJaccardMinHash(Set,k)
    Nu = length(Set);
    J=zeros(Nu,Nu); % array para guardar distancias
    sig = zeros(k,Nu);
    p = 100001029;
    a = randi([1,p-1],1,k);
    b = randi([1,p-1],1,k);
    for n=1 : Nu
        for i=1 : k
            h = zeros(1,length(Set(n)));
            for it = 1 : length(Set{n})
                h(1,it) = rem(a(i)*Set{n}(it,1)+b(i),p);
            end
            sig(i,n) = min(h); %min
        end 
    end

    for n1= 1: Nu
        for n2= n1+1:Nu
            m = sig(:,n1) - sig(:,n2);
            J(n1,n2) = 1 - (numel(m) - nnz(m))/k;
        end
    end
end