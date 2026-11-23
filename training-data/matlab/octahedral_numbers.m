% n(2n^2+1)/3
for n = 1:15
    v = floor((n * (((2 * n) * n) + 1)) / 3);
    fprintf('%2d -> %d\n', n, v);
end
