v = [1 2 3 4];

sq = arrayfun(@(x) x^2, v);
disp(sq)

words = arrayfun(@(n) repmat('*', 1, n), v, 'UniformOutput', false);
disp(words)

[mx, mn] = arrayfun(@(k) deal(k + 1, k - 1), v);
disp([mx; mn])

s(1).name = 'ann'; s(1).age = 30;
s(2).name = 'bob'; s(2).age = 25;
ages = arrayfun(@(p) p.age, s);
disp(ages)
names = arrayfun(@(p) upper(p.name), s, 'UniformOutput', false);
disp(names)

safe = arrayfun(@(x) 1 / x, [1 0 2], 'ErrorHandler', @(err, x) -1);
disp(safe)

A = magic(3);
col_max = arrayfun(@(j) max(A(:, j)), 1:size(A, 2));
disp(col_max)

c = {1, 'two', [3 4]};
disp(cellfun(@numel, c))
disp(cellfun(@ischar, c))
disp(cellfun(@(x) x(1), c, 'UniformOutput', false))
m = containers.Map({'a', 'b'}, [10 20]);
disp(cell2mat(values(m)))
