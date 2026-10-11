rng(1);
n = 100000;
pts = rand(n, 2);
inside = sum(sum(pts .^ 2, 2) <= 1);
est = 4 * inside / n;
fprintf('pi ~ %.3f\n', est);
