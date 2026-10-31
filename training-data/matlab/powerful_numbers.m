function powerful_numbers()
    found = [];
    for n = 1:100
        if is_powerful(n)
            found(end + 1) = n; %#ok<AGROW>
        end
    end
    disp(found);
end

function ok = is_powerful(n)
    [primes_found, ~, idx] = unique(factor(n));
    counts = accumarray(idx(:), 1);
    ok = n == 1 || all(counts >= 2);
end
