function min_multiplications(dims::Vector{Int})
    n = length(dims) - 1
    dp = zeros(Int, n + 1, n + 1)

    for len in 2:n
        for i in 1:(n - len + 1)
            j = i + len - 1
            dp[i, j] = typemax(Int)
            for k in i:(j - 1)
                cost = dp[i, k] + dp[k + 1, j] + dims[i] * dims[k + 1] * dims[j + 1]
                dp[i, j] = min(dp[i, j], cost)
            end
        end
    end
    return dp[1, n]
end

println(min_multiplications([40, 20, 30, 10, 30]))
