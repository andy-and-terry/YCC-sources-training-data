function idx = binary_search_recursive(arr, low, high, target)
    if low > high
        idx = -1;
        return;
    end
    mid = floor((low + high) / 2);
    if arr(mid) == target
        idx = mid;
    elseif arr(mid) < target
        idx = binary_search_recursive(arr, mid + 1, high, target);
    else
        idx = binary_search_recursive(arr, low, mid - 1, target);
    end
end
