function merge(left::Vector{Int}, right::Vector{Int})
    result = Int[]
    i, j = 1, 1
    while i <= length(left) && j <= length(right)
        if left[i] <= right[j]
            push!(result, left[i])
            i += 1
        else
            push!(result, right[j])
            j += 1
        end
    end
    append!(result, left[i:end])
    append!(result, right[j:end])
    return result
end

function merge_sort(items::Vector{Int})
    if length(items) <= 1
        return items
    end
    mid = div(length(items), 2)
    left = merge_sort(items[1:mid])
    right = merge_sort(items[mid+1:end])
    return merge(left, right)
end

println(merge_sort([5, 2, 9, 1, 5, 6]))
