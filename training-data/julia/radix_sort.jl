function radix_sort(arr::Vector{Int})
    result = copy(arr)
    max_val = maximum(result)
    exp = 1
    while max_val ÷ exp > 0
        buckets = [Int[] for _ in 1:10]
        for x in result
            digit = (x ÷ exp) % 10
            push!(buckets[digit + 1], x)
        end
        result = vcat(buckets...)
        exp *= 10
    end
    return result
end

println(radix_sort([170, 45, 75, 90, 802, 24, 2, 66]))
