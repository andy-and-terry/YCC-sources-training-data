is_factorion(n) = n == sum(factorial(d) for d in digits(n))

println(filter(is_factorion, 1:49999))
