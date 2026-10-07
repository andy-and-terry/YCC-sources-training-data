x = 0:5;
y = 2 * x.^2 - 3 * x + 1;

p = polyfit(x, y, 2);
fprintf('%.4f ', p);
fprintf('\n');

disp(polyval(p, 6))
disp(polyval([1 0 -1], [2 3]))

r = roots([1 -3 2]);
disp(sort(r)')

disp(poly([1 2]))
disp(conv([1 1], [1 -1]))
[q, rem_] = deconv([1 0 -1], [1 1]);
disp(q)
disp(rem_)
disp(polyder([3 2 1]))
disp(polyint([6 2]))

noisy = y + [0.1 -0.1 0.05 -0.05 0.02 0];
p1 = polyfit(x, noisy, 1);
fprintf('slope %.3f intercept %.3f\n', p1(1), p1(2));
resid = noisy - polyval(p1, x);
fprintf('rms residual %.3f\n', sqrt(mean(resid.^2)));
