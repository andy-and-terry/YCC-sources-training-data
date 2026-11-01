sq = @(x) x .^ 2;
disp(sq(1:5))
disp(arrayfun(@(k) k * 2, 1:4))
disp(cellfun(@length, {'a', 'bb', 'ccc'}))
compose = @(f, g) @(x) f(g(x));
h = compose(@sqrt, sq);
disp(h(-3))
