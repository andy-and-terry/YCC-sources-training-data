rosen = @(p) (1 - p(1))^2 + 100 * (p(2) - p(1)^2)^2;
opts = optimset('TolX', 1e-8, 'TolFun', 1e-8);
[p, fval] = fminsearch(rosen, [-1.2 1], opts);
fprintf('min at (%.3f, %.3f), value %.2e\n', p(1), p(2), fval);
