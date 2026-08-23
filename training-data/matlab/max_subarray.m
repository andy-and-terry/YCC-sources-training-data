function best = max_subarray(items)
    best = items(1);
    current = items(1);
    for i = 2:numel(items)
        current = max(items(i), current + items(i));
        best = max(best, current);
    end
end
