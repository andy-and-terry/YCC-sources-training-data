x = [5 3 8 3 1 8 9];

idx = find(x > 4);
disp(idx)
disp(find(x == 3, 1))
disp(find(x > 100))

[sorted, order] = sort(x);
disp(sorted)
disp(order)
disp(sort(x, 'descend'))

[u, first_idx, group] = unique(x);
disp(u)
disp(first_idx')
disp(group')

[counts, values] = histcounts_manual(x);
for k = 1:numel(values)
    fprintf('%d appears %d times\n', values(k), counts(k));
end

M = [3 1; 2 9; 2 4];
disp(sortrows(M))
disp(sortrows(M, -2))
[m, i] = max(x);
fprintf('max %d at %d\n', m, i);
disp(any(x > 8))
disp(all(x > 0))

function [counts, values] = histcounts_manual(v)
    values = unique(v);
    counts = arrayfun(@(u) sum(v == u), values);
end
