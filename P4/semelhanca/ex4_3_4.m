set = init("u.data");
tic
j = distanciaJaccardMinHash(set, 150);
toc
ms = mostSimular(j, 0.4);