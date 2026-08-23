function two_sum(nums::Vector{Int}, target::Int)
    seen = Dict{Int, Int}()
    for (i, n) in enumerate(nums)
        complement = target - n
        if haskey(seen, complement)
            return (seen[complement], i)
        end
        seen[n] = i
    end
    return nothing
end

println(two_sum([2, 7, 11, 15], 9))
