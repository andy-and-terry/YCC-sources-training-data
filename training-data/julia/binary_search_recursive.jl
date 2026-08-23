function binary_search(arr::Vector{Int}, low::Int, high::Int, target::Int)
    if low > high
        return -1
    end
    mid = div(low + high, 2)
    if arr[mid] == target
        return mid
    elseif arr[mid] < target
        return binary_search(arr, mid + 1, high, target)
    else
        return binary_search(arr, low, mid - 1, target)
    end
end

data = [1, 3, 5, 7, 9, 11]
println(binary_search(data, 1, length(data), 7))
