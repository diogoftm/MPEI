function J = distanciaJaccard(Set)
    Nu = length(Set);
    J=zeros(Nu,Nu); % array para guardar distancias
    h= waitbar(0,"Calculating");
    for n1= 1: Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
            J(n1,n2) = 1 - length(intersect(Set{n1},Set{n2})) / length(union(Set{n1},Set{n2}));
        end
    end
    delete(h);
end