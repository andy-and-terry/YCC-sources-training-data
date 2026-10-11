x = 0:4;
y = [0 1 0 -1 0];
xq = [0.5 1.5 2.5];
disp(interp1(x, y, xq, 'linear'));
disp(interp1(x, y, xq, 'spline'));
disp(interp1(x, y, xq, 'nearest'));
disp(spline(x, y, 2.5));
