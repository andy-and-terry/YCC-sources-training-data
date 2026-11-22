# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
function ispractical(n)
    reach = UInt64(1)  # bit i set <=> i is a subset sum
    for d in 1:n
        n % d == 0 && (reach |= reach << d)
    end
    mask = (UInt64(1) << (n + 1)) - 1
    return reach & mask == mask
end

println(join(filter(ispractical, 1:40), " "))
