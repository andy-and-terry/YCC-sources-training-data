% unique, ismember, setdiff and find idioms
a = [5 3 5 1 3 9];
[u, ia, ic] = unique(a);
disp(u); disp(ia'); disp(ic');
counts = accumarray(ic(:), 1)';
disp(counts);
disp(ismember([1 2 3], a));
disp(setdiff(a, [3 5]));
disp(find(a == 3, 1, 'last'));
