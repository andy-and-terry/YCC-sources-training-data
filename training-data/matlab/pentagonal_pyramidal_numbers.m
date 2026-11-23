% n^2(n+1)/2
for n = 1:15
    v = floor(((n * n) * (n + 1)) / 2);
    fprintf('%2d -> %d\n', n, v);
end
