function power_set(nums::Vector{Int})
    result = [Int[]]
    for num in nums
        result = vcat(result, [vcat(subset, num) for subset in result])
    end
    return result
end

subsets = power_set([1, 2, 3])
for s in subsets
    println(s)
end
println("total subsets: ", length(subsets))
