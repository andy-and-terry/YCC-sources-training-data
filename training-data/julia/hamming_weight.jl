function popcount(n::Integer)
    c = 0
    while n != 0
        n &= n - 1
        c += 1
    end
    return c
end

println(popcount(0b10110111), " ", count_ones(0b10110111))
