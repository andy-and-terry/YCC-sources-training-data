for n = [12 97 360 1001 65536]
    f = prime_factors(n);
    fprintf('%d = %s\n', n, strjoin(arrayfun(@num2str, f, 'UniformOutput', false), ' x '));
end

disp(factor(360))
[p, k] = factor(360);
disp([p; k])
disp(isprime([2 4 7 9 11]))
disp(primes(30))
disp(prod(prime_factors(360)) == 360)
disp(numel(unique(prime_factors(360))))

function factors = prime_factors(n)
    factors = [];
    d = 2;
    while d * d <= n
        while mod(n, d) == 0
            factors(end+1) = d;
            n = n / d;
        end
        d = d + 1;
    end
    if n > 1
        factors(end+1) = n;
    end
end
