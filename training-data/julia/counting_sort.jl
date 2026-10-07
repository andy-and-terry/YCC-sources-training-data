function counting_sort(arr::Vector{Int})
    if isempty(arr)
        return Int[]
    end
    lo, hi = minimum(arr), maximum(arr)
    counts = zeros(Int, hi - lo + 1)
    for v in arr
        counts[v - lo + 1] += 1
    end
    result = Int[]
    for (i, count) in enumerate(counts)
        append!(result, fill(i + lo - 1, count))
    end
    return result
end

println(counting_sort([4, 2, 2, 8, 3, 3, 1]))
