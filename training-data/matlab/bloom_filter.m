function bf = bloom_new(size)
    bf.size = size;
    bf.bits = false(1, size);
end

function idx = bloom_hash(bf, value, seed)
    idx = mod(sum(double(char(value))) * seed + seed, bf.size) + 1;
end

function bf = bloom_add(bf, value)
    for seed = [1, 7, 13]
        bf.bits(bloom_hash(bf, value, seed)) = true;
    end
end

function present = bloom_might_contain(bf, value)
    present = true;
    for seed = [1, 7, 13]
        if ~bf.bits(bloom_hash(bf, value, seed))
            present = false;
            return
        end
    end
end

bf = bloom_new(32);
bf = bloom_add(bf, 'apple');
bf = bloom_add(bf, 'banana');
disp(bloom_might_contain(bf, 'apple'))
disp(bloom_might_contain(bf, 'cherry'))
