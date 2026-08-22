numbers = 1:10
even_squares = [n^2 for n in numbers if n % 2 == 0]
total = sum(numbers)

println(even_squares)
println(total)
