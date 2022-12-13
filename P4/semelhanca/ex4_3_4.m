set = init("u.data");
tic
j = distanciaJaccardMinHash(set, 100);
toc
ms = mostSimular(j, 0.4);