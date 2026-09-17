function sift_down!(arr::Vector{Int}, root::Int, heap_size::Int)
    largest = root
    left = 2 * root
    right = 2 * root + 1

    if left <= heap_size && arr[left] > arr[largest]
        largest = left
    end
    if right <= heap_size && arr[right] > arr[largest]
        largest = right
    end

    if largest != root
        arr[root], arr[largest] = arr[largest], arr[root]
        sift_down!(arr, largest, heap_size)
    end
end

function heap_sort!(arr::Vector{Int})
    n = length(arr)
    for i in div(n, 2):-1:1
        sift_down!(arr, i, n)
    end
    for last in n:-1:2
        arr[1], arr[last] = arr[last], arr[1]
        sift_down!(arr, 1, last - 1)
    end
    return arr
end

println(heap_sort!([8, 3, 5, 1, 9, 2, 7, 4]))
