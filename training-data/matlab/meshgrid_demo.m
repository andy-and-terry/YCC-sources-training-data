[X, Y] = meshgrid(1:4, 1:3);
disp(X);
disp(Y);

Z = X .* Y;
disp(Z);

R = sqrt(X .^ 2 + Y .^ 2);
fprintf('max distance: %.3f\n', max(R(:)));

% Evaluate f(x, y) = x^2 - y on a grid
f = @(x, y) x .^ 2 - y;
xs = linspace(-1, 1, 5);
ys = linspace(0, 2, 3);
[XX, YY] = meshgrid(xs, ys);
F = f(XX, YY);
disp(F);
[minVal, linearIdx] = min(F(:));
[row, col] = ind2sub(size(F), linearIdx);
fprintf('min %.2f at x=%.2f, y=%.2f\n', minVal, xs(col), ys(row));

% ndgrid swaps the orientation
[A, B] = ndgrid(1:2, 1:3);
disp(A);
disp(B);

% Count lattice points inside a circle
[gx, gy] = meshgrid(-5:5);
inside = gx .^ 2 + gy .^ 2 <= 25;
disp(nnz(inside));
disp(size(gx));
