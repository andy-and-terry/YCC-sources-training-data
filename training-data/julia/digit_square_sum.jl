digit_square_sum(n::Integer) = sum(d^2 for d in digits(abs(n)))

println(digit_square_sum(123))
println(digit_square_sum(-99))
