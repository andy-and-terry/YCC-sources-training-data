% Fast modular exponentiation by squaring
fprintf('%d\n', powmod(2, 100, 1000003));
fprintf('%d\n', powmod(7, 560, 561));

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
