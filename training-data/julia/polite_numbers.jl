# Ways to write n as a sum of two or more consecutive positive integers.
function polite_ways(n)
    ways = 0
    k = 2
    while k * (k + 1) ÷ 2 <= n
        (n - k * (k - 1) ÷ 2) % k == 0 && (ways += 1)
        k += 1
    end
    return ways
end

println(join(map(polite_ways, 1:16), " "))
