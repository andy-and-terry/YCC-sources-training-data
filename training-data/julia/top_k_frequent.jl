function top_k_frequent(nums, k)
    counts = Dict{eltype(nums),Int}()
    for n in nums
        counts[n] = get(counts, n, 0) + 1
    end
    ranked = sort(collect(counts); by = p -> (-p.second, p.first))
    return [p.first for p in ranked[1:min(k, end)]]
end

println(top_k_frequent([1, 1, 1, 2, 2, 3], 2))
println(top_k_frequent([4, 4, 5, 6, 6, 6, 7], 1))
println(top_k_frequent(["a", "b", "a"], 5))
