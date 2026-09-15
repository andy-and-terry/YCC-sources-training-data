function next_greater_elements(nums::Vector{Int})
    n = length(nums)
    result = fill(-1, n)
    stack = Int[]

    for i in 1:n
        while !isempty(stack) && nums[stack[end]] < nums[i]
            idx = pop!(stack)
            result[idx] = nums[i]
        end
        push!(stack, i)
    end

    return result
end

println(next_greater_elements([2, 1, 2, 4, 3]))
println(next_greater_elements([4, 3, 2, 1]))
