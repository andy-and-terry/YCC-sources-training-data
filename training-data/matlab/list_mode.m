items = [1 2 2 3 3 4];
[vals, ~, idx] = unique(items);
counts = accumarray(idx(:), 1)';
modes = vals(counts == max(counts));

disp(modes);
