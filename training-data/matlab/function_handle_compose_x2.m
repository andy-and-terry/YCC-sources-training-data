f = @(x) x.^2;
g = @(x) x + 1;
h = @(x) f(g(x));
disp(h(1:4))
