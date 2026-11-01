# Evil numbers have an even number of 1 bits.
println(join(filter(n -> iseven(count_ones(n)), 0:20), " "))
