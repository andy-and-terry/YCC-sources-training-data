# Lazy caterer sequence: max pieces from n cuts
term(n) = ((n * (n + 1)) ÷ 2) + 1

println(join(map(term, 0:9), " "))
