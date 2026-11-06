% Fermat primality test; Carmichael number 561 fools it.
function fermat_primality()
    for n = [97 91 561]
        fprintf('%d %d\n', n, probably_prime(n));
    end
end

function r = powmod(b, e, m)
    r = 1;
    b = mod(b, m);
    while e > 0
        if mod(e, 2) == 1
            r = mod(r * b, m);
        end
        b = mod(b * b, m);
        e = floor(e / 2);
    end
end

function tf = probably_prime(n)
    tf = n > 2 && powmod(2, n - 1, n) == 1;
end
