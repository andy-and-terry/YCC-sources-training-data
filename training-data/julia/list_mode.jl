function modes(items)
    counts = Dict{eltype(items),Int}()
    for x in items
        counts[x] = get(counts, x, 0) + 1
    end
    top = maximum(values(counts))
    sort([k for (k, c) in counts if c == top])
end

println(modes([1, 2, 2, 3, 3, 4]))
