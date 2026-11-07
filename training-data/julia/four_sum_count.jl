function four_sum_count(a, b, c, d)
    sums = Dict{Int,Int}()
    for x in a, y in b
        sums[x+y] = get(sums, x + y, 0) + 1
    end
    return sum(get(sums, -(x + y), 0) for x in c, y in d)
end

println(four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2])) # 2
