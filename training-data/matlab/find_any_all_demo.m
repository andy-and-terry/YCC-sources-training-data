v = [3 8 1 9 4 7 2];

disp(find(v > 5));
disp(find(v > 5, 1));
disp(find(v > 5, 2, 'last'));
disp(isempty(find(v > 100)));

disp(any(v > 8));
disp(all(v > 0));
disp(any(v == 5));

M = [1 0 3; 4 5 0; 0 8 9];
disp(any(M));
disp(all(M));
disp(any(M, 2)');
disp(all(M(:) >= 0));

[r, c] = find(M == 0);
disp([r c]);
[r, c, val] = find(M);
disp(numel(val));

disp(nnz(M));
disp(sum(M(:) > 4));
disp(cumsum(v > 4));
disp(xor(v > 3, v < 8));

idx = find(diff(sign(diff(v))) < 0) + 1;
fprintf('local maxima at positions: %s\n', mat2str(idx));
disp(v(idx));

disp(find(strcmp({'a', 'b', 'a'}, 'a')));
disp(any(isnan([1 NaN 3])));
disp(min(find(cumsum(v) > 20)));
