% n(n+1)(2n+1)/6
for n = 1:15
    v = floor(((n * (n + 1)) * ((2 * n) + 1)) / 6);
    fprintf('%2d -> %d\n', n, v);
end
