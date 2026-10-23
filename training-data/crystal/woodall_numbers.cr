# Woodall numbers: W(n) = n * 2^n - 1
def woodall(n : Int32) : Int64
  n.to_i64 * (1_i64 << n) - 1
end

puts((1..10).map { |n| woodall(n) }.join(" "))
