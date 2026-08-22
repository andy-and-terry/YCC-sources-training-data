function binary_search(arr::Vector{Int}, target::Int)
    low, high = 1, length(arr)
    while low <= high
        mid = div(low + high, 2)
        if arr[mid] == target
            return mid
        elseif arr[mid] < target
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return -1
end

sorted = [1, 3, 5, 7, 9, 11, 13]
println(binary_search(sorted, 7))
println(binary_search(sorted, 4))
