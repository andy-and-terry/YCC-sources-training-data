function build_lps(pattern::String)
    n = length(pattern)
    lps = zeros(Int, n)
    len = 0
    i = 2
    while i <= n
        if pattern[i] == pattern[len + 1]
            len += 1
            lps[i] = len
            i += 1
        elseif len != 0
            len = lps[len]
        else
            lps[i] = 0
            i += 1
        end
    end
    return lps
end

function kmp_search(text::String, pattern::String)
    lps = build_lps(pattern)
    n = length(text)
    m = length(pattern)
    i, j = 1, 1
    while i <= n
        if text[i] == pattern[j]
            i += 1
            j += 1
            if j > m
                return i - j
            end
        elseif j > 1
            j = lps[j - 1]
        else
            i += 1
        end
    end
    return -1
end

println(kmp_search("abxabcabcaby", "abcaby"))
