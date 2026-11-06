# Integer (1..3999) to Roman numeral using a greedy table.
const TABLE = [
    1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC",
    50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I",
]

function to_roman(n)
    out = IOBuffer()
    for (value, symbol) in TABLE
        while n >= value
            print(out, symbol)
            n -= value
        end
    end
    return String(take!(out))
end

println(to_roman(1994), " ", to_roman(58))
