# Lazy caterer sequence: max pieces from n cuts
def term(n : Int64) : Int64
  ((n * (n + 1))/2) + 1
end

puts (0_i64...10_i64).map { |n| term(n) }.join(" ")
