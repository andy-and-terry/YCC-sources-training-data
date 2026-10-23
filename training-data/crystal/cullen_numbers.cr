# Cullen numbers: C(n) = n * 2^n + 1
def cullen(n : Int32) : Int64
  n.to_i64 * (1_i64 << n) + 1
end

puts((0..9).map { |n| cullen(n) }.join(" "))
