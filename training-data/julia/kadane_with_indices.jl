function max_subarray(a::Vector{Int})
    best, cur = a[1], a[1]
    start, best_start, best_end = 1, 1, 1
    for i in 2:length(a)
        if cur < 0
            cur = a[i]
            start = i
        else
            cur += a[i]
        end
        if cur > best
            best = cur
            best_start, best_end = start, i
        end
    end
    return best, a[best_start:best_end]
end

println(max_subarray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
println(max_subarray([-3, -1, -2]))
