% n(n+1)(n+2)(n+3)/24
for n = 1:15
    v = floor((((n * (n + 1)) * (n + 2)) * (n + 3)) / 24);
    fprintf('%2d -> %d\n', n, v);
end
