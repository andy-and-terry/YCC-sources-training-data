v = [4 0 7 0 0 9 2];

idx = find(v);
disp(idx);
disp(find(v == 0));
disp(find(v > 3, 2));
disp(find(v > 3, 1, 'last'));

disp(any(v));
disp(all(v));
disp(any(v > 8));
disp(all(v >= 0));

M = [1 0 3; 0 0 6; 7 8 9];
disp(any(M));
disp(all(M));
disp(any(M, 2)');
disp(any(M(:) == 8));

[r, c] = find(M > 6);
disp([r c]);

if isempty(find(v < 0, 1))
    disp('no negative values');
end

first_zero = find(v == 0, 1);
fprintf('first zero at index %d\n', first_zero);
fprintf('nonzero count: %d\n', nnz(v));
