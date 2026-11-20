% Aliquot sum classification.
for n = [6 12 15 28]
    d = 1:n-1;
    a = sum(d(mod(n, d) == 0));
    if a == n, kind = 'perfect'; elseif a > n, kind = 'abundant'; else, kind = 'deficient'; end
    fprintf('%d %d %s\n', n, a, kind);
end
