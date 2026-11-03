values = [3 1 4 1 5 9 2 6];
prefix = [0, cumsum(values)];
query = @(lo, hi) prefix(hi + 1) - prefix(lo + 1);

disp(query(2, 5));
