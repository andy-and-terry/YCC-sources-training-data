function duval(s::String)
    out = String[]
    n, i = length(s), 1
    while i <= n
        j, k = i + 1, i
        while j <= n && s[k] <= s[j]
            k = s[k] < s[j] ? i : k + 1
            j += 1
        end
        while i <= k
            push!(out, s[i:i+j-k-1])
            i += j - k
        end
    end
    return out
end

println(duval("banana"))
