function minimum_total(t)
    dp = copy(t[end])
    for r in length(t)-1:-1:1
        for i in eachindex(t[r])
            dp[i] = t[r][i] + min(dp[i], dp[i+1])
        end
    end
    return dp[1]
end

println(minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])) # 11
