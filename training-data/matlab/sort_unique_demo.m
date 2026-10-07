v = [4 2 9 2 7 4 1];

[sorted, idx] = sort(v);
disp(sorted);
disp(idx);
disp(sort(v, 'descend'));

[u, firstIdx] = unique(v, 'first');
disp(u);
disp(firstIdx');
disp(unique(v, 'stable'));

M = [3 1; 1 2; 2 9; 1 1];
disp(sortrows(M));
disp(sortrows(M, -2));
disp(sortrows(M, [1 -2]));

names = {'pear', 'Apple', 'fig', 'banana'};
disp(sort(names));
[~, order] = sort(lower(names));
disp(names(order));

lens = cellfun(@numel, names);
[~, byLen] = sort(lens);
disp(names(byLen));

disp(issorted(sorted));
disp(max(v));
[m, pos] = min(v);
fprintf('min %d at %d\n', m, pos);
top3 = sorted(end-2:end);
disp(top3);
disp(histc(v, 1:9));
