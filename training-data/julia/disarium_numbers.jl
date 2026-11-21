# Disarium numbers: digits raised to their 1-based positions sum to n.
is_disarium(n) = sum(d^i for (i, d) in enumerate(reverse(digits(n)))) == n

println(join(filter(is_disarium, 1:999), " "))
