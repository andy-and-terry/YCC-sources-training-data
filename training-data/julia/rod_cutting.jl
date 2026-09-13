function rod_cutting(prices::Vector{Int}, n::Int)
    dp = zeros(Int, n + 1)
    for length in 1:n
        best = -1
        for cut in 1:length
            best = max(best, prices[cut] + dp[length - cut + 1])
        end
        dp[length + 1] = best
    end
    return dp[n + 1]
end

prices = [1, 5, 8, 9, 10, 17, 17, 20]
println(rod_cutting(prices, 8))
println(rod_cutting(prices, 4))
