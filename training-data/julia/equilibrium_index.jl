function equilibrium_index(nums)
    total = sum(nums)
    left = 0
    for (i, v) in enumerate(nums)
        left == total - left - v && return i
        left += v
    end
    return nothing
end

println(equilibrium_index([1, 7, 3, 6, 5, 6])) # 4 (1-based)
