function digit_sum(n::Int)
    total = 0
    num = n
    while num > 0
        total += num % 10
        num = div(num, 10)
    end
    return total
end

println(digit_sum(12345))
