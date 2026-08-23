function insertion_sort(items::Vector{Int})
    arr = copy(items)
    for i in 2:length(arr)
        key = arr[i]
        j = i - 1
        while j >= 1 && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end
        arr[j + 1] = key
    end
    return arr
end

println(insertion_sort([12, 11, 13, 5, 6]))
