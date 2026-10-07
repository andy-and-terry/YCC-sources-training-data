function permute(nums::Vector{Int})
    isempty(nums) && return [Int[]]
    result = Vector{Vector{Int}}()
    for i in eachindex(nums)
        rest = vcat(nums[1:i - 1], nums[i + 1:end])
        for perm in permute(rest)
            push!(result, vcat(nums[i], perm))
        end
    end
    return result
end

perms = permute([1, 2, 3])
for p in perms
    println(p)
end
println("total permutations: ", length(perms))
