function selection_sort(items::Vector{Int})
    arr = copy(items)
    n = length(arr)
    for i in 1:n-1
        min_idx = i
        for j in i+1:n
            if arr[j] < arr[min_idx]
                min_idx = j
            end
        end
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    end
    return arr
end

println(selection_sort([5, 3, 8, 1, 9, 2]))
