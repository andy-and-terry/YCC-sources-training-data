function my_gcd(a::Int, b::Int)
    while b != 0
        a, b = b, a % b
    end
    return a
end

println(my_gcd(48, 18))
println(my_gcd(100, 75))
