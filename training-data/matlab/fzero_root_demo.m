f = @(x) cos(x) - x;
root = fzero(f, [0 1]);
fprintf('root %.6f, residual %.2e\n', root, f(root));
g = @(x) x.^3 - 2*x - 5;
fprintf('cubic root %.6f\n', fzero(g, 2));
