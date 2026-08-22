function quicksort(items::Vector{Int})
    if length(items) <= 1
        return items
    end
    pivot = items[div(length(items), 2) + 1]
    left = filter(x -> x < pivot, items)
    mid = filter(x -> x == pivot, items)
    right = filter(x -> x > pivot, items)
    return vcat(quicksort(left), mid, quicksort(right))
end

println(quicksort([5, 3, 8, 1, 9, 2]))
