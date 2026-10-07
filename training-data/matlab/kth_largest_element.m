function result = kth_largest_element(arr, k)
    % Quickselect on a copy: partition around a pivot until the pivot
    % lands exactly at the (n-k)th index of the ascending order.
    n = length(arr);
    target = n - k + 1;
    lo = 1; hi = n;
    while true
        pivotIndex = partition(arr, lo, hi);
        if pivotIndex == target
            result = arr(pivotIndex);
            return
        elseif pivotIndex < target
            lo = pivotIndex + 1;
        else
            hi = pivotIndex - 1;
        end
    end
end

function pivotIndex = partition(arr, lo, hi)
    pivot = arr(hi);
    i = lo;
    for j = lo:hi - 1
        if arr(j) <= pivot
            tmp = arr(i); arr(i) = arr(j); arr(j) = tmp;
            i = i + 1;
        end
    end
    tmp = arr(i); arr(i) = arr(hi); arr(hi) = tmp;
    pivotIndex = i;
end

disp(kth_largest_element([3, 2, 1, 5, 6, 4], 2))
