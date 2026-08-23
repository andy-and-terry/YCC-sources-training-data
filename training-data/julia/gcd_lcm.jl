function my_gcd(a::Int, b::Int)
    while b != 0
        a, b = b, a % b
    end
    return abs(a)
end

function my_lcm(a::Int, b::Int)
    return abs(a * b) ÷ my_gcd(a, b)
end

println(my_gcd(48, 18))
println(my_lcm(4, 6))
