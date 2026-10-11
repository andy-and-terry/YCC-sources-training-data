x = sort([7 15 36 39 40 41]);
n = numel(x);
q = @(p) interp1(((1:n) - 0.5) / n, x, p, 'linear', 'extrap');
fprintf('Q1 %.2f median %.2f Q3 %.2f\n', q(0.25), q(0.5), q(0.75));
