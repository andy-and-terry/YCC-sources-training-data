function sorted = merge_sort_algo(items)
    if numel(items) <= 1
        sorted = items;
        return;
    end
    mid = floor(numel(items) / 2);
    left = merge_sort_algo(items(1:mid));
    right = merge_sort_algo(items(mid+1:end));
    sorted = merge_arrays(left, right);
end

function result = merge_arrays(left, right)
    result = [];
    i = 1; j = 1;
    while i <= numel(left) && j <= numel(right)
        if left(i) <= right(j)
            result(end+1) = left(i);
            i = i + 1;
        else
            result(end+1) = right(j);
            j = j + 1;
        end
    end
    result = [result, left(i:end), right(j:end)];
end
