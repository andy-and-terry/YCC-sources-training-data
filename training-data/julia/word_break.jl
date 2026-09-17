function word_break(s::String, word_dict::Set{String})
    n = length(s)
    dp = falses(n + 1)
    dp[1] = true

    for i in 1:n
        for j in 0:(i - 1)
            if dp[j + 1] && s[(j + 1):i] in word_dict
                dp[i + 1] = true
            end
        end
    end

    return dp[n + 1]
end

dict = Set(["leet", "code", "apple", "pen"])
println(word_break("leetcode", dict))
println(word_break("applepenapple", dict))
println(word_break("catsandog", dict))
