x = linspace(0, pi, 101);
y = sin(x);
c = cumtrapz(x, y);
fprintf('integral of sin over [0,pi] = %.4f\n', c(end));
fprintf('at pi/2 = %.4f\n', c(51));
