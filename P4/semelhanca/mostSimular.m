function SimilarUsers = mostSimular(J,threshold)
    SimilarUsers= zeros(1,3);
    k= 1;
    Nu = length(J);
    for n1= 1:Nu
        for n2= n1+1:Nu
            if J(n1,n2)<threshold
                SimilarUsers(k,:) = [n1 n2 J(n1,n2)];
                k= k+1;
            end
        end
    end
end