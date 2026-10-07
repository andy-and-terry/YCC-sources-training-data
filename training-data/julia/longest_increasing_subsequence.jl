function longest_increasing_subsequence(arr::Vector{Int})
    n = length(arr)
    n == 0 && return 0
    dp = ones(Int, n)
    for i in 2:n
        for j in 1:(i - 1)
            if arr[j] < arr[i] && dp[j] + 1 > dp[i]
                dp[i] = dp[j] + 1
            end
        end
    end
    return maximum(dp)
end

println(longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18]))
