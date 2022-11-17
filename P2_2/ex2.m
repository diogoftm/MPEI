S = [5 50 100];
pX = [90/100 9/100 1/100];

%stem(S, pX)

acum = [cumsum(pX)];
stairs([5,50,100], acum);