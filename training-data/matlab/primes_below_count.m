function count = primes_below_count(n)
    if n < 3
        count = 0;
        return;
    end
    isPrime = true(1, n);
    isPrime(1) = false;
    for i = 2:floor(sqrt(n - 1))
        if isPrime(i)
            isPrime(i*i:i:n) = false;
        end
    end
    count = sum(isPrime(2:n-1));
end

disp(primes_below_count(100));
