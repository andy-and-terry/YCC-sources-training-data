# Tetrahedral numbers n(n+1)(n+2)/6
def term(n : Int64) : Int64
  ((n * (n + 1)) * (n + 2))/6
end

puts (0_i64...10_i64).map { |n| term(n) }.join(" ")
