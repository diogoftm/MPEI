function check = bf_check(bitVec, str, n_hashes)
    for i=1 : n_hashes
        str= [str num2str(i)];
        if bitVec(1,mod(string2hash(str), length(bitVec))+1) ~= 1
            check = 0;
            return
        end
    end
    check = 1;
end
