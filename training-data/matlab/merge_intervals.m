function merged = merge_intervals(intervals)
    if isempty(intervals)
        merged = [];
        return
    end
    [~, order] = sort(intervals(:, 1));
    sorted = intervals(order, :);
    merged = sorted(1, :);
    for i = 2:size(sorted, 1)
        last = merged(end, :);
        current = sorted(i, :);
        if current(1) <= last(2)
            merged(end, 2) = max(last(2), current(2));
        else
            merged = [merged; current];
        end
    end
end

intervals = [1 3; 2 6; 8 10; 15 18];
disp(merge_intervals(intervals))
