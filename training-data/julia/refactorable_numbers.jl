tau(n) = count(d -> n % d == 0, 1:n)

println([n for n in 1:59 if n % tau(n) == 0]) # [1, 2, 8, 9, 12, 18, 24, 36, 40, 56]
