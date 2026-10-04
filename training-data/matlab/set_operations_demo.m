a = [5 1 3 3 7 9];
b = [3 4 5 6];

disp(union(a, b));
disp(intersect(a, b));
disp(setdiff(a, b));
disp(setxor(a, b));
disp(unique(a));

[tf, loc] = ismember([1 2 3 4], a);
disp(tf);
disp(loc);

disp(ismember(7, a));

[c, ia, ib] = intersect(a, b);
disp(c);
disp(ia');
disp(ib');

names1 = {'ann', 'bob', 'cy'};
names2 = {'bob', 'di'};
disp(union(names1, names2));
disp(intersect(names1, names2));
disp(setdiff(names1, names2));
disp(ismember('cy', names1));

[u, ~, idx] = unique([10 20 10 30 20 10]);
disp(u);
disp(accumarray(idx(:), 1)');
