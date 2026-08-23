function is_power_of_two(n::Int)
    return n > 0 && (n & (n - 1)) == 0
end

println(is_power_of_two(16))
println(is_power_of_two(18))
