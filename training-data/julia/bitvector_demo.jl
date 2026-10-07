bv = BitVector([true, false, true, true, false])
println(bv)
println(count(bv), " ", sum(bv))
println(.!bv)
println(bv .& BitVector([true, true, false, true, true]))
println(findall(bv))

flags = falses(8)
flags[[2, 5, 7]] .= true
println(flags)
println(findfirst(flags))

# Bit manipulation on integers
x = 0b1011_0110
println(count_ones(x), " ", count_zeros(UInt8(x)))
println(leading_zeros(UInt8(5)), " ", trailing_zeros(8))
println(bitstring(UInt8(5)))
println(x >> 2, " ", x << 1, " ", x & 0xf, " ", xor(x, 0xff))
println(parse(Int, "1011"; base = 2))
