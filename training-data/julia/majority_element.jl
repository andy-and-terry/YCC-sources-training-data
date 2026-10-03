# Boyer-Moore voting algorithm: O(n) time, O(1) space.
function majority_element(nums::Vector{Int})
    candidate = nothing
    count = 0
    for x in nums
        if count == 0
            candidate = x
            count = 1
        elseif x == candidate
            count += 1
        else
            count -= 1
        end
    end
    return candidate
end

println(majority_element([2, 2, 1, 1, 1, 2, 2]))
println(majority_element([3, 3, 4, 2, 3, 3, 3]))
