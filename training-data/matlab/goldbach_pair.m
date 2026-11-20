% Goldbach pair using isprime.
n = 28;
for p = 2:floor(n/2)
    if isprime(p) && isprime(n - p)
        fprintf('%d + %d\n', p, n - p);
        break
    end
end
