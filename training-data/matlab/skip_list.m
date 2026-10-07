function sl = skiplist_new(maxLevel)
    sl.maxLevel = maxLevel;
    sl.levels = cell(1, maxLevel);
    for i = 1:maxLevel
        sl.levels{i} = [];
    end
end

function sl = skiplist_insert(sl, value)
    % Simplified skip list: coin-flip levels decide which sorted
    % sub-lists a value is duplicated into, giving O(log n) expected
    % search without balancing like a tree would need.
    level = 1;
    while level < sl.maxLevel && rand() < 0.5
        level = level + 1;
    end
    for i = 1:level
        sl.levels{i} = sort([sl.levels{i}, value]);
    end
end

function found = skiplist_search(sl, value)
    topLevel = sl.maxLevel;
    found = any(sl.levels{topLevel} == value) || any(sl.levels{1} == value);
end

sl = skiplist_new(3);
for v = [3, 1, 4, 1, 5, 9, 2, 6]
    sl = skiplist_insert(sl, v);
end
disp(sl.levels{1})
disp(skiplist_search(sl, 5))
