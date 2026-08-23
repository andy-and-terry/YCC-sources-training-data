function kadane(items::Vector{Int})
    best = items[1]
    current = items[1]
    for i in 2:length(items)
        current = max(items[i], current + items[i])
        best = max(best, current)
    end
    return best
end

println(kadane([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
