scores = [88 92 75 92 60];
[sorted, idx] = sort(scores, 'descend');
disp(sorted);
disp(idx);
names = {'a', 'b', 'c', 'd', 'e'};
disp(names(idx));
[~, rank] = sort(idx);
disp(rank);
