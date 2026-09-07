function extended_gcd(a::Int, b::Int)
    if b == 0
        return (a, 1, 0)
    end
    g, x1, y1 = extended_gcd(b, a % b)
    x = y1
    y = x1 - div(a, b) * y1
    return (g, x, y)
end

g, x, y = extended_gcd(35, 15)
println("gcd=$g x=$x y=$y")
println(35 * x + 15 * y == g)
