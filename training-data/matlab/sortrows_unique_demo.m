A = [3 9; 1 5; 3 2; 2 7; 1 1];

disp(sortrows(A));
disp(sortrows(A, 2));
disp(sortrows(A, -1));
disp(sortrows(A, [1 -2]));

[sorted, idx] = sort([40 10 30 20], 'descend');
disp(sorted);
disp(idx);

[u, ia, ic] = unique([5 3 5 1 3 3]);
disp(u);
disp(ia');
disp(ic');

disp(unique([5 3 5 1 3], 'stable'));

names = {'carol', 'alice', 'bob', 'alice'};
disp(sort(names));
disp(unique(names));

counts = histcounts([1 2 2 3 3 3], 1:4);
disp(counts);
disp(issorted([1 2 2 5]));
