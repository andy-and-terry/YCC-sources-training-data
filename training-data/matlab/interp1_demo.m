x = [0 1 2 3 4];
y = [0 1 4 9 16];

disp(interp1(x, y, 2.5))
disp(interp1(x, y, [0.5 1.5 3.5]))
disp(interp1(x, y, 2.5, 'nearest'))
disp(interp1(x, y, 2.5, 'spline'))
disp(interp1(x, y, 2.5, 'pchip'))
disp(interp1(x, y, 5))
disp(interp1(x, y, 5, 'linear', 'extrap'))
disp(interp1(x, y, 5, 'linear', 0))

xq = linspace(0, 4, 9);
yq = interp1(x, y, xq);
disp(yq)

[X, Y] = meshgrid(0:2, 0:2);
Z = X + 10 * Y;
disp(interp2(X, Y, Z, 0.5, 1.5))
disp(linspace(0, 1, 5))
