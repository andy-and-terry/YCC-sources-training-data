function counting_sort(arr::Vector{Int}, max_val::Int)
    counts = zeros(Int, max_val + 1)
    for v in arr
        counts[v + 1] += 1
    end

    result = Int[]
    for v in 0:max_val
        for _ in 1:counts[v + 1]
            push!(result, v)
        end
    end
    return result
end

println(counting_sort([4, 2, 9, 6, 2, 1, 9, 4], 9))
