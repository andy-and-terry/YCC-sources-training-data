function sorted = counting_sort(arr)
    if isempty(arr)
        sorted = arr;
        return
    end
    lo = min(arr);
    hi = max(arr);
    counts = zeros(1, hi - lo + 1);
    for i = 1:numel(arr)
        counts(arr(i) - lo + 1) = counts(arr(i) - lo + 1) + 1;
    end
    sorted = [];
    for v = lo:hi
        sorted = [sorted, repmat(v, 1, counts(v - lo + 1))];
    end
end

disp(counting_sort([4 2 2 8 3 3 1]))
