% Structured matrices: Toeplitz (constant diagonals), Hankel, Vandermonde
T = toeplitz([1 2 3 4]);
disp(T);

T2 = toeplitz([1 4 5], [1 2 3 7]);
disp(T2);

H = hankel([1 2 3]);
disp(H);

% Vandermonde matrix: columns are decreasing powers of the input
x = [1 2 3 4];
V = vander(x);
disp(V);

% Fit a quadratic exactly through three points by solving V*c = y
px = [0 1 2];
py = [1 3 7];
c = vander(px) \ py';
fprintf('coefficients: %s\n', mat2str(c', 4));

% Same result via polyfit
disp(polyfit(px, py, 2));

% Toeplitz matrices model convolution
h = [1 2 3];
sig = [1 0 -1 2];
disp(conv(h, sig));
