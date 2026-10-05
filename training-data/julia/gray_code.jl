gray_code(n::Int) = [i ⊻ (i >> 1) for i in 0:(1 << n) - 1]

for g in gray_code(3)
    println(string(g, base = 2, pad = 3))
end

println(count_ones(0b101101), " ", trailing_zeros(40), " ", leading_zeros(UInt8(1)))
println(bitstring(UInt8(5)))
