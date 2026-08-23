function is_armstrong(n::Int)
    digits_str = string(n)
    power = length(digits_str)
    total = sum(parse(Int, d)^power for d in digits_str)
    return total == n
end

println(is_armstrong(153))
println(is_armstrong(154))
