function three_sum(nums::Vector{Int})
    sorted = sort(nums)
    n = length(sorted)
    result = Vector{Vector{Int}}()

    for i in 1:(n - 2)
        if i > 1 && sorted[i] == sorted[i - 1]
            continue
        end
        left, right = i + 1, n
        while left < right
            total = sorted[i] + sorted[left] + sorted[right]
            if total < 0
                left += 1
            elseif total > 0
                right -= 1
            else
                push!(result, [sorted[i], sorted[left], sorted[right]])
                while left < right && sorted[left] == sorted[left + 1]
                    left += 1
                end
                while left < right && sorted[right] == sorted[right - 1]
                    right -= 1
                end
                left += 1
                right -= 1
            end
        end
    end
    return result
end

println(three_sum([-1, 0, 1, 2, -1, -4]))
