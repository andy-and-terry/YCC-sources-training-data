function longest_palindrome(s::String)
    chars = collect(s)
    n = length(chars)
    if n == 0
        return ""
    end
    start, best_len = 1, 1

    function expand(left::Int, right::Int)
        while left >= 1 && right <= n && chars[left] == chars[right]
            left -= 1
            right += 1
        end
        return left + 1, right - left - 1
    end

    for i in 1:n
        l1, len1 = expand(i, i)
        if len1 > best_len
            start, best_len = l1, len1
        end
        l2, len2 = expand(i, i + 1)
        if len2 > best_len
            start, best_len = l2, len2
        end
    end

    return String(chars[start:start + best_len - 1])
end

println(longest_palindrome("babad"))
println(longest_palindrome("cbbd"))
