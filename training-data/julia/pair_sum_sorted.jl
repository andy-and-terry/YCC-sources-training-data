function pair_with_sum(nums::AbstractVector, target)
    i, j = firstindex(nums), lastindex(nums)
    while i < j
        s = nums[i] + nums[j]
        s == target && return (i, j)
        s < target ? (i += 1) : (j -= 1)
    end
    return nothing
end

println(pair_with_sum([1, 3, 4, 6, 8, 11], 10))
println(pair_with_sum([1, 2, 3], 100))
