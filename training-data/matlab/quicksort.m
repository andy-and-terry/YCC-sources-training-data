function sorted = quicksort(items)
    if numel(items) <= 1
        sorted = items;
        return;
    end
    pivot = items(ceil(numel(items) / 2));
    left = items(items < pivot);
    mid = items(items == pivot);
    right = items(items > pivot);
    sorted = [quicksort(left), mid, quicksort(right)];
end
