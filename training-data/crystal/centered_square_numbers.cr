# Centered square numbers 2n(n+1)+1
def term(n : Int64) : Int64
  ((2 * n) * (n + 1)) + 1
end

puts (0_i64...10_i64).map { |n| term(n) }.join(" ")
