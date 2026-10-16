function longest_consecutive(nums)
    s = Set(nums)
    best = 0
    for n in s
        (n - 1) in s && continue
        len = 1
        while (n + len) in s
            len += 1
        end
        best = max(best, len)
    end
    return best
end

println(longest_consecutive([100, 4, 200, 1, 3, 2]))
println(longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]))
println(longest_consecutive(Int[]))
