function [i, j] = two_sum(nums, target)
    seen = containers.Map('KeyType', 'double', 'ValueType', 'double');
    i = -1; j = -1;
    for idx = 1:numel(nums)
        complement = target - nums(idx);
        if isKey(seen, complement)
            i = seen(complement);
            j = idx;
            return;
        end
        seen(nums(idx)) = idx;
    end
end
