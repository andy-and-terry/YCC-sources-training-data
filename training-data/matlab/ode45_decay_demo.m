k = 0.5;
f = @(t, y) -k * y;
[t, y] = ode45(f, [0 4], 1);
exact = exp(-k * t(end));
fprintf('numeric %.5f exact %.5f\n', y(end), exact);
