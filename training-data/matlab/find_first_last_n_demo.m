x = [0 3 0 5 7 0 2];
disp(find(x));
disp(find(x, 2));
disp(find(x, 1, 'last'));
[r, c] = find(magic(4) > 12);
disp([r c]);
disp(nnz(x));
