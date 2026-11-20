# Wilson's theorem primality test.
wilson(n) = n >= 2 && foldl((f, i) -> f * i % n, 2:n-1; init = 1) == n - 1
println(filter(wilson, 2:19))
