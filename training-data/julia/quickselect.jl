function quickselect(arr::Vector{Int}, k::Int)
    a = copy(arr)
    left, right = 1, length(a)
    while true
        pivot = a[right]
        store = left
        for i in left:right-1
            if a[i] < pivot
                a[i], a[store] = a[store], a[i]
                store += 1
            end
        end
        a[store], a[right] = a[right], a[store]
        if k == store
            return a[k]
        elseif k < store
            right = store - 1
        else
            left = store + 1
        end
    end
end

println(quickselect([7, 10, 4, 3, 20, 15], 3))
println(quickselect([1, 2, 3, 4, 5], 1))
