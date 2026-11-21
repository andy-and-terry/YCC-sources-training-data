# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
is_munchausen(n) = sum(d == 0 ? 0 : d^d for d in digits(n)) == n

println(join(filter(is_munchausen, 1:4999), " "))
