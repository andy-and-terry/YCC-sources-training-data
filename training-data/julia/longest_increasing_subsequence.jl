function longest_increasing_subsequence(nums::Vector{Int})
    n = length(nums)
    n == 0 && return 0

    tails = Int[]
    for x in nums
        lo, hi = 1, length(tails) + 1
        while lo < hi
            mid = (lo + hi) ÷ 2
            if tails[mid] < x
                lo = mid + 1
            else
                hi = mid
            end
        end
        if lo > length(tails)
            push!(tails, x)
        else
            tails[lo] = x
        end
    end
    return length(tails)
end

println(longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18]))
println(longest_increasing_subsequence([0, 1, 0, 3, 2, 3]))
println(longest_increasing_subsequence(Int[]))
