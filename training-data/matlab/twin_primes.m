p = primes(50);
twin = p(diff(p) == 2);
disp([twin; twin + 2]');
