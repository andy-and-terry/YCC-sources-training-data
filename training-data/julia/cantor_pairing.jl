# Cantor pairing function and its inverse.
pair(x, y) = (x + y) * (x + y + 1) ÷ 2 + y

function unpair(z)
    w = (isqrt(8z + 1) - 1) ÷ 2
    y = z - w * (w + 1) ÷ 2
    return (w - y, y)
end

println(pair(3, 4))
println(join(unpair(32), " "))
