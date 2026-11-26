# Squarefree numbers up to 100; expect 61.
squarefree(n) = all(d -> n % (d * d) != 0, 2:isqrt(n))
println(count(squarefree, 1:100))
