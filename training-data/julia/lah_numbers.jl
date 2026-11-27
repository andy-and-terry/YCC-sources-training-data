lah(n, k) = binomial(big(n - 1), k - 1) * factorial(big(n)) ÷ factorial(big(k))

for n in 1:5
    println(join((lah(n, k) for k in 1:n), " "))
end
