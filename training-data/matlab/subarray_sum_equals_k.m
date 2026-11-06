% Count contiguous subarrays whose sum equals k (prefix sums + containers.Map).
function subarray_sum_equals_k()
    disp(count_subarrays([1 1 1], 2));
end

function count = count_subarrays(nums, k)
    seen = containers.Map('KeyType', 'double', 'ValueType', 'double');
    seen(0) = 1;
    total = 0;
    count = 0;
    for x = nums
        total = total + x;
        if isKey(seen, total - k)
            count = count + seen(total - k);
        end
        if isKey(seen, total)
            seen(total) = seen(total) + 1;
        else
            seen(total) = 1;
        end
    end
end
