function lcs(a::String, b::String)
    m, n = length(a), length(b)
    table = zeros(Int, m + 1, n + 1)
    for i in 1:m
        for j in 1:n
            if a[i] == b[j]
                table[i + 1, j + 1] = table[i, j] + 1
            else
                table[i + 1, j + 1] = max(table[i, j + 1], table[i + 1, j])
            end
        end
    end

    result = Char[]
    i, j = m, n
    while i > 0 && j > 0
        if a[i] == b[j]
            push!(result, a[i])
            i -= 1
            j -= 1
        elseif table[i, j + 1] >= table[i + 1, j]
            i -= 1
        else
            j -= 1
        end
    end
    return String(reverse(result))
end

println(lcs("ABCBDAB", "BDCABA"))
println(length(lcs("abcde", "ace")))
