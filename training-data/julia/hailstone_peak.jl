# Highest value reached by the Collatz (hailstone) sequence from n.
function peak(n)
    best = n
    while n != 1
        n = iseven(n) ? n ÷ 2 : 3n + 1
        best = max(best, n)
    end
    return best
end

println(peak(27))
