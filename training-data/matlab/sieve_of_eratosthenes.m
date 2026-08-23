function primes_list = sieve_of_eratosthenes(limit)
    is_composite = false(1, limit);
    for i = 2:floor(sqrt(limit))
        if ~is_composite(i)
            for j = i*i:i:limit
                is_composite(j) = true;
            end
        end
    end
    primes_list = find(~is_composite);
    primes_list = primes_list(primes_list >= 2);
end
