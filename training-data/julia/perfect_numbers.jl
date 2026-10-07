function aliquot_sum(n::Integer)
    n == 1 && return 0
    total = 1
    for i in 2:isqrt(n)
        if n % i == 0
            total += i
            i != n ÷ i && (total += n ÷ i)
        end
    end
    return total
end

function classify(n::Integer)
    s = aliquot_sum(n)
    s == n ? :perfect : s > n ? :abundant : :deficient
end

foreach(n -> println(n, " ", classify(n)), (6, 12, 28, 13, 8128))
