sigma = @(n) sum(find(mod(n, 1:n) == 0));
d = arrayfun(@(n) sigma(n) < 2 * n, 1:20);
disp(find(d));
