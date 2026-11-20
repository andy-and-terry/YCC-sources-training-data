# Aliquot sum classification.
aliquot(n) = sum(d for d in 1:n-1 if n % d == 0; init = 0)
for n in (6, 12, 15, 28)
    a = aliquot(n)
    println(n, " ", a, " ", a == n ? "perfect" : a > n ? "abundant" : "deficient")
end
