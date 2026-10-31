function persistence(n)
    steps = 0
    while n >= 10
        n = prod(digits(n))
        steps += 1
    end
    steps
end

for n in (39, 77, 999, 10)
    println(n, " ", persistence(n))
end
