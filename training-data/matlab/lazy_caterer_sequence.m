% n(n+1)/2+1
for n = 1:15
    v = floor((n * (n + 1)) / 2) + 1;
    fprintf('%2d -> %d\n', n, v);
end
