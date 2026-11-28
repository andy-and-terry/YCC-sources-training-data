n = 28;
p = primes(n / 2);
p = p(isprime(n - p));
disp([p; n - p]');
