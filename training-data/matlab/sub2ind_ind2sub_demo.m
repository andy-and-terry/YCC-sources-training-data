A = magic(4);
[r, c] = size(A);

idx = sub2ind([r c], 2, 3);
fprintf('linear index of (2,3): %d\n', idx);
fprintf('A(idx) = %d, A(2,3) = %d\n', A(idx), A(2, 3));

[row, col] = ind2sub([r c], 11);
fprintf('index 11 -> (%d,%d)\n', row, col);

rows = [1 2 3];
cols = [4 3 2];
diag_vals = A(sub2ind([r c], rows, cols));
disp(diag_vals);

[mx, where] = max(A(:));
[mr, mc] = ind2sub(size(A), where);
fprintf('max %d at (%d,%d)\n', mx, mr, mc);
