function sophie_germain_primes()
    found = [];
    p = 2;
    while numel(found) < 10
        if isprime(p) && isprime(2 * p + 1)
            found(end + 1) = p; %#ok<AGROW>
        end
        p = p + 1;
    end
    disp(found); % 2 3 5 11 23 29 41 53 83 89
end
