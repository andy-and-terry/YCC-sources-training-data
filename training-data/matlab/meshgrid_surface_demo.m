x = -2:1:2;
y = -1:1:1;
[X, Y] = meshgrid(x, y);

disp(X);
disp(Y);

Z = X.^2 + Y.^2;
disp(Z);
fprintf('max at (%d, %d) = %d\n', X(Z == max(Z(:))), Y(Z == max(Z(:))), max(Z(:)));

% ndgrid has swapped orientation
[A, B] = ndgrid(1:3, 1:2);
disp(size(A));
disp(A);

% evaluate a 2-D function on a grid
f = @(u, v) sin(u) .* cos(v);
[U, V] = meshgrid(linspace(0, pi, 3));
disp(round(f(U, V), 3));

% distance of every grid point from the origin
D = sqrt(X.^2 + Y.^2);
disp(D <= 1);
fprintf('points inside unit circle: %d\n', nnz(D <= 1));
