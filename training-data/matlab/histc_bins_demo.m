data = [1 2 2 3 3 3 4 4 4 4];
[counts, vals] = groupcounts_manual(data);
disp([vals; counts]);

function [counts, vals] = groupcounts_manual(d)
    vals = unique(d);
    counts = arrayfun(@(v) sum(d == v), vals);
end
