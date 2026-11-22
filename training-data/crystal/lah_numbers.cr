# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
def fact(n : Int32) : Int64
  (1..n).reduce(1_i64) { |acc, i| acc * i }
end

def comb(n : Int32, k : Int32) : Int64
  fact(n) // (fact(k) * fact(n - k))
end

n = 5
puts (1..n).map { |k| comb(n - 1, k - 1) * fact(n) // fact(k) }.join(" ")
