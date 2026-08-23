function min_coins(coins::Vector{Int}, amount::Int)
    dp = fill(-1, amount + 1)
    dp[1] = 0
    for n in 1:amount
        for c in coins
            if c <= n && dp[n - c + 1] != -1
                if dp[n + 1] == -1 || dp[n - c + 1] + 1 < dp[n + 1]
                    dp[n + 1] = dp[n - c + 1] + 1
                end
            end
        end
    end
    return dp[amount + 1]
end

println(min_coins([1, 2, 5], 11))
