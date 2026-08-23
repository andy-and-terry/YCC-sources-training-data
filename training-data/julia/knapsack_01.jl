function knapsack(weights::Vector{Int}, values::Vector{Int}, capacity::Int)
    dp = zeros(Int, capacity + 1)
    for i in 1:length(weights)
        for cap in capacity:-1:weights[i]
            dp[cap + 1] = max(dp[cap + 1], dp[cap - weights[i] + 1] + values[i])
        end
    end
    return dp[capacity + 1]
end

println(knapsack([2, 3, 4, 5], [3, 4, 5, 6], 5))
