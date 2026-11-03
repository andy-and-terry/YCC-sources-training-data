is_perfect_square(n::Integer) = n >= 0 && isqrt(n)^2 == n

println(filter(is_perfect_square, 0:29))
