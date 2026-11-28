function pollard_rho
    n = 8051;
    p = rho(n);
    fprintf('%d = %d * %d\n', n, p, n / p);
end

function d = rho(n)
    if mod(n, 2) == 0, d = 2; return; end
    f = @(v) mod(v * v + 1, n);
    x = 2; y = 2; d = 1;
    while d == 1
        x = f(x);
        y = f(f(y));
        d = gcd(abs(x - y), n);
    end
end
