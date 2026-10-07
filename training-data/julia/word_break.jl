function word_break(s::String, word_dict::Set{String})
    n = length(s)
    dp = falses(n + 1)
    dp[1] = true

    for i in 1:n
        if !dp[i]
            continue
        end
        for j in (i + 1):(n + 1)
            if dp[j]
                continue
            end
            word = s[i:(j - 1)]
            if word in word_dict
                dp[j] = true
            end
        end
    end

    return dp[n + 1]
end

dict1 = Set(["leet", "code"])
println(word_break("leetcode", dict1))

dict2 = Set(["apple", "pen"])
println(word_break("applepenapple", dict2))
println(word_break("catsandog", Set(["cats", "dog", "sand", "and", "cat"])))
