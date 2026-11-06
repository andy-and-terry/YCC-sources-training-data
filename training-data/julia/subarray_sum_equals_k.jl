# Count contiguous subarrays whose sum equals k (prefix sums + Dict).
function count_subarrays(nums, k)
    seen = Dict(0 => 1)
    total = count = 0
    for x in nums
        total += x
        count += get(seen, total - k, 0)
        seen[total] = get(seen, total, 0) + 1
    end
    return count
end

println(count_subarrays([1, 1, 1], 2))
