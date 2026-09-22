function z_array(s::String)
    n = length(s)
    z = zeros(Int, n)
    z[1] = n
    left, right = 1, 1
    for i in 2:n
        if i <= right
            z[i] = min(right - i + 1, z[i - left + 1])
        end
        while i + z[i] <= n && s[z[i] + 1] == s[i + z[i]]
            z[i] += 1
        end
        if i + z[i] - 1 > right
            left, right = i, i + z[i] - 1
        end
    end
    return z
end

function z_search(text::String, pattern::String)
    combined = pattern * "\$" * text
    z = z_array(combined)
    matches = Int[]
    plen = length(pattern)
    for i in (plen + 2):length(combined)
        if z[i] == plen
            push!(matches, i - plen - 1)
        end
    end
    return matches
end

println(z_array("aabxaabxcaabxaabxay"))
println(z_search("aabxaabxcaabxaabxay", "aabx"))
