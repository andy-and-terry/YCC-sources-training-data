# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
def fact(n) = (1..n).reduce(1, :*)
def comb(n, k) = fact(n) / (fact(k) * fact(n - k))

n = 5
puts (1..n).map { |k| comb(n - 1, k - 1) * fact(n) / fact(k) }.join(" ")
