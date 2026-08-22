function index = binary_search(arr, target)
    low = 1;
    high = numel(arr);
    index = -1;
    while low <= high
        mid = floor((low + high) / 2);
        if arr(mid) == target
            index = mid;
            return;
        elseif arr(mid) < target
            low = mid + 1;
        else
            high = mid - 1;
        end
    end
end
