function [lo, hi] = min_max_recursive(arr)
    if numel(arr) == 1
        lo = arr(1);
        hi = arr(1);
        return
    end
    [lo_rest, hi_rest] = min_max_recursive(arr(2:end));
    lo = min(arr(1), lo_rest);
    hi = max(arr(1), hi_rest);
end
