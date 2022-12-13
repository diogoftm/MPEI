function J = distanciaJaccardMinHash(Set,k)
    Nu = length(Set);
    J=zeros(Nu,Nu); % array para guardar distancias
    sig = zeros(k,Nu);

    for n=1 : Nu
        for i=1 : k
            h = zeros(1,length(Set(n)));
            for it = 1 : length(Set{n})
                %h = DJB31MA(Set{n}(it,1), rem(51*i+32,10000*18));
                h(1,it) = rem(i*Set{n}(it,1)+201,887);
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