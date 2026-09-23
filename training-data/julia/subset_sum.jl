function subset_sum(nums::Vector{Int}, target::Int)
    n = length(nums)
    dp = falses(target + 1)
    dp[1] = true  # dp[s+1] represents whether sum s is achievable

    for num in nums
        for s in target:-1:num
            if dp[s - num + 1]
                dp[s + 1] = true
            end
        end
    end

    return dp[target + 1]
end

println(subset_sum([3, 34, 4, 12, 5, 2], 9))   # true (4 + 5)
println(subset_sum([3, 34, 4, 12, 5, 2], 30))  # false
println(subset_sum([1, 2, 3, 7], 6))           # true (1 + 2 + 3)
