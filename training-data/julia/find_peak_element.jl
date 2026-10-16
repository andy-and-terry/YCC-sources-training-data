function find_peak(a::Vector{Int})
    lo, hi = 1, length(a)
    while lo < hi
        mid = (lo + hi) ÷ 2
        if a[mid] < a[mid + 1]
            lo = mid + 1
        else
            hi = mid
        end
    end
    return lo
end

a = [1, 2, 1, 3, 5, 6, 4]
p = find_peak(a)
println("peak at ", p, " value ", a[p])
println(find_peak([1, 2, 3, 4]))
println(find_peak([9, 3, 1]))
