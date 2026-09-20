function longest_increasing_subsequence(nums::Vector{Int})
    n = length(nums)
    n == 0 && return 0

    lengths = ones(Int, n)
    for i in 2:n
        for j in 1:(i - 1)
            if nums[j] < nums[i] && lengths[j] + 1 > lengths[i]
                lengths[i] = lengths[j] + 1
            end
        end
    end

    return maximum(lengths)
end

println(longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18]))
println(longest_increasing_subsequence([0, 1, 0, 3, 2, 3]))
