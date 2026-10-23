x = [3 -1 4 -1 5 -9 2 6];
mask = x > 0;
positives = x(mask)
idx = find(x < 0)
x(x < 0) = 0
count = nnz(mask)
[val, pos] = max(x)
