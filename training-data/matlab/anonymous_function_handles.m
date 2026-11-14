f = @(x, a) a * x.^2;
g = @(x) f(x, 3);
disp(g(2));
h = @sin;
disp(h(pi / 2));
