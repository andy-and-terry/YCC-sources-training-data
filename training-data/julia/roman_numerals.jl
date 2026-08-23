function to_roman(n::Int)
    values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    result = ""
    remaining = n
    for (v, s) in zip(values, symbols)
        while remaining >= v
            result *= s
            remaining -= v
        end
    end
    return result
end

println(to_roman(1994))
