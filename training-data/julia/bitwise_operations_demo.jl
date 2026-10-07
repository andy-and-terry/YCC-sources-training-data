x = 0b101100
println(count_ones(x), " ", trailing_zeros(x), " ", leading_zeros(UInt8(x)))
println(x & -x, " ", x & (x - 1))
println(5 | 2, " ", xor(5, 3), " ", 5 ⊻ 3, " ", ~5)
println(1 << 10, " ", 1024 >> 3, " ", -16 >>> 60)
println(bitstring(UInt8(37)))
println(string(255, base=16), " ", parse(Int, "ff", base=16), " ", string(5, base=2, pad=8))
println(ispow2(64), " ", ispow2(65), " ", nextpow(2, 100))

function subsets_mask(items)
    n = length(items)
    [[items[i] for i in 1:n if (m >> (i - 1)) & 1 == 1] for m in 0:(2^n - 1)]
end
println(subsets_mask([:a, :b, :c]))
