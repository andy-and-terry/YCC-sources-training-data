function heapify!(arr::Vector{Int}, n::Int, i::Int)
    largest = i
    left = 2i
    right = 2i + 1

    if left <= n && arr[left] > arr[largest]
        largest = left
    end
    if right <= n && arr[right] > arr[largest]
        largest = right
    end
    if largest != i
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify!(arr, n, largest)
    end
end

function heap_sort!(arr::Vector{Int})
    n = length(arr)
    for i in div(n, 2):-1:1
        heapify!(arr, n, i)
    end
    for i in n:-1:2
        arr[1], arr[i] = arr[i], arr[1]
        heapify!(arr, i - 1, 1)
    end
    return arr
end

println(heap_sort!([5, 3, 8, 1, 9, 2, 7]))
println(heap_sort!([1]))
println(heap_sort!(Int[]))
