% Implicit expansion (broadcasting) and the equivalent bsxfun calls.

A = [1 2 3; 4 5 6; 7 8 9];
rowMeans = mean(A, 2);          % 3x1 column
colMeans = mean(A, 1);          % 1x3 row

% Subtract the row mean from every row (column vs matrix expands)
centered = A - rowMeans;
disp(centered);

% Same result with bsxfun
same = bsxfun(@minus, A, rowMeans);
fprintf('identical: %d\n', isequal(centered, same));

% Column-wise normalization
scaled = (A - colMeans) ./ std(A, 0, 1);
fprintf('col means ~0: %d\n', all(abs(mean(scaled, 1)) < 1e-12));

% Outer operations via a column and a row vector
r = (1:4)';
c = 1:5;
table = r * 10 + c;             % 4x5 grid
disp(table);

% Pairwise distance between 1-D points
pts = [0 3 7];
D = abs(pts' - pts);
disp(D);
