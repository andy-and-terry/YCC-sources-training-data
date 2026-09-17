function lcs_length(a::String, b::String)
    m, n = length(a), length(b)
    dp = zeros(Int, m + 1, n + 1)

    for i in 1:m, j in 1:n
        if a[i] == b[j]
            dp[i + 1, j + 1] = dp[i, j] + 1
        else
            dp[i + 1, j + 1] = max(dp[i, j + 1], dp[i + 1, j])
        end
    end

    return dp[m + 1, n + 1]
end

println(lcs_length("abcde", "ace"))
println(lcs_length("abc", "abc"))
println(lcs_length("abc", "def"))
