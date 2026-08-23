function edit_distance(a::String, b::String)
    m, n = length(a), length(b)
    table = zeros(Int, m + 1, n + 1)
    for i in 0:m
        table[i + 1, 1] = i
    end
    for j in 0:n
        table[1, j + 1] = j
    end
    for i in 1:m
        for j in 1:n
            cost = a[i] == b[j] ? 0 : 1
            table[i + 1, j + 1] = min(
                table[i, j + 1] + 1,
                table[i + 1, j] + 1,
                table[i, j] + cost
            )
        end
    end
    return table[m + 1, n + 1]
end

println(edit_distance("kitten", "sitting"))
