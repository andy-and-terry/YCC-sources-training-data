function sorted = insertion_sort_algo(items)
    arr = items;
    for i = 2:numel(arr)
        key = arr(i);
        j = i - 1;
        while j >= 1 && arr(j) > key
            arr(j + 1) = arr(j);
            j = j - 1;
        end
        arr(j + 1) = key;
    end
    sorted = arr;
end
