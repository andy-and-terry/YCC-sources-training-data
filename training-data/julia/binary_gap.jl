function binary_gap(n::Integer)
    bits = rstrip(string(n, base = 2), '0')
    return maximum(length, split(bits, '1'); init = 0)
end

for n in (9, 529, 20, 15, 1041)
    println(n, " ", string(n, base = 2), " ", binary_gap(n))
end
