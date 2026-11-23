% n(n+1)(n+2)/6
for n = 1:15
    v = floor(((n * (n + 1)) * (n + 2)) / 6);
    fprintf('%2d -> %d\n', n, v);
end
