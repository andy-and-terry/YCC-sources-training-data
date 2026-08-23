function sorted = selection_sort_algo(items)
    arr = items;
    n = numel(arr);
    for i = 1:n-1
        min_idx = i;
        for j = i+1:n
            if arr(j) < arr(min_idx)
                min_idx = j;
            end
        end
        tmp = arr(i);
        arr(i) = arr(min_idx);
        arr(min_idx) = tmp;
    end
    sorted = arr;
end
