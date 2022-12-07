function bitVec = bf_add(bitVec, str, n_hashes)
    for i=1 : n_hashes
        str= [str num2str(i)];
        bitVec(1,mod(string2hash(str), length(bitVec))+1) = 1;
    end
end