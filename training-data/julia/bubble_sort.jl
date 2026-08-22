function bubble_sort(arr::Vector{Int})
    a = copy(arr)
    n = length(a)
    for i in 1:n
        for j in 1:(n - i)
            if a[j] > a[j + 1]
                a[j], a[j + 1] = a[j + 1], a[j]
            end
        end
    end
    return a
end

println(bubble_sort([5, 2, 9, 1, 5, 6]))
