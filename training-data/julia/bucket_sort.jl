function bucket_sort(arr::Vector{Float64})
    n = length(arr)
    buckets = [Float64[] for _ in 1:n]

    for x in arr
        idx = min(n, Int(floor(x * n)) + 1)
        push!(buckets[idx], x)
    end

    result = Float64[]
    for bucket in buckets
        append!(result, sort(bucket))
    end
    return result
end

println(bucket_sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12]))
